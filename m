Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD523079A0
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 16:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CD66E984;
	Thu, 28 Jan 2021 15:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADE66E982
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 15:26:17 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10SFJuIQ118435;
 Thu, 28 Jan 2021 15:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=2gLXiKCgRSS7kTFwCYui5MzR6pPKfBNKiPKEY7OQMgY=;
 b=gXPKERt+Fh24YexAqdwWgz3yhxChk94LGX69wA793D+trr/TxxloojLJnSyA1RsPXAkx
 StsSDCcYK1Wlef9js1oC27V4MOyz+/YqYazJZ7KtSkrgfyOxx61wrC55KA4NKf3MdYkJ
 udMvFA3iwbEz7cf6KrCQy33px8mJDTmXzedBYXl2PIHdA5cCB3j8vZyxjlvEks8ShR41
 OXkcmdVMsbOtYgUrfisN5ComUBjSkr5noqKvUOo2+GB/uEOIz9i7YxKHQU9uomZvW6Im
 rEartVXsyEFV7bz/imqdDxA3n9Z0V9NnIJBXJpDO5rW+EMwxDeemMkf1aWFKhrQPwDzQ dA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 368b7r4pg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jan 2021 15:26:09 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10SFJqP9134457;
 Thu, 28 Jan 2021 15:24:07 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 368wju6y2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jan 2021 15:24:07 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10SFO21G020707;
 Thu, 28 Jan 2021 15:24:02 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 28 Jan 2021 07:24:01 -0800
Date: Thu, 28 Jan 2021 18:23:52 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v12] staging: fbtft: add tearing signal detect
Message-ID: <20210128152352.GH2696@kadam>
References: <1611838435-151774-1-git-send-email-zhangxuezhi3@gmail.com>
 <CAHp75Vd=ijxnamuSYuxNLeyhGMCod=HaXWrQ0W0+3QCsQAychg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75Vd=ijxnamuSYuxNLeyhGMCod=HaXWrQ0W0+3QCsQAychg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0
 adultscore=0 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101280079
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1011 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101280079
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Deepak R Varma <mh12gx2825@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 oliver.graute@kococonnector.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stefano Brivio <sbrivio@redhat.com>, Carlis <zhangxuezhi3@gmail.com>,
 Colin King <colin.king@canonical.com>, zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKYW4gMjgsIDIwMjEgYXQgMDQ6MzM6MDJQTSArMDIwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+ID4gKyAgICAgICAgICAgICAgIGluaXRfY29tcGxldGlvbigmc3BpX3BhbmVsX3Rl
KTsKPiA+ICsgICAgICAgICAgICAgICByYyA9IGRldm1fcmVxdWVzdF9pcnEoZGV2LAo+IAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBncGlvZF90b19pcnEocGFyLT5n
cGlvLnRlKSwKPiAKPiAuLi5hbmQgaGVyZSBzaW1wbHkgdXNlIGlycS4KPiAKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzcGlfcGFuZWxfdGVfaGFuZGxlciwgSVJRRl9U
UklHR0VSX1JJU0lORywKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
VEVfR1BJTyIsIHBhcik7Cj4gCj4gPiArICAgICAgICAgICAgICAgaWYgKElTX0VSUihyYykpCj4g
Cj4gVGhpcyBpcyB3cm9uZy4gcmMgaXMgaW50ZWdlciBubyBJU19FUlIoKSBpcyByZXF1aXJlZC4g
RGl0dG8gZm9yCj4gUFRSX0VSUigpLiBIYXZlIHlvdSBldmVuIGxvb2tlZCBmb3IgdGhlc2UgbWFj
cm9zIGltcGxlbWVudGF0aW9ucz8KPiAKClllYWguLi4gIEl0IGxlYWRzIHRvIGEgY29tcGlsZSB3
YXJuaW5nOgoKCXdhcm5pbmc6IHBhc3NpbmcgYXJndW1lbnQgMSBvZiDigJhJU19FUlLigJkgbWFr
ZXMgcG9pbnRlciBmcm9tIGludGVnZXIgd2l0aG91dCBhIGNhc3QgWy1XaW50LWNvbnZlcnNpb25d
CgpyZWdhcmRzLApkYW4gY2FycGVudGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
