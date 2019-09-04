Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC08BA8344
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 14:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72508966C;
	Wed,  4 Sep 2019 12:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAC58966C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 12:57:25 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x84Crrb8074477;
 Wed, 4 Sep 2019 12:57:17 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2utdp3r0un-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 Sep 2019 12:57:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x84CrgRN142441;
 Wed, 4 Sep 2019 12:57:17 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2us5pj31tw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 Sep 2019 12:57:16 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x84CvEpM029671;
 Wed, 4 Sep 2019 12:57:14 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 04 Sep 2019 05:57:13 -0700
Date: Wed, 4 Sep 2019 15:57:04 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm: panel-lvds: Potential Oops in probe error handling
Message-ID: <20190904125704.GC3093@kadam>
References: <20190904100329.GE7007@mwanda>
 <20190904115057.GC4811@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190904115057.GC4811@pendragon.ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9369
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909040129
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9369
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909040129
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=zzmD9+q0DyZUpt7+k5TVx+uVeOvzTaoUPW4sKDLHV+k=;
 b=J8yVz9eOM+if2/Lz0C6xpucF3Cm09wkN0V/erhilc5r17z/koZwFw6BsgqeGEMYdQJb0
 hKF7BMV32WY5imH+mpg/FRO1MqNqE/umBkWQpTGfpQcXhzqOdmFJGg751ZfCPDPFqRZ4
 +nsBgyDeL/5w2bMhVl0tp4HR77X+xMsG1gkJWwI+oH0OqdyFCO+pZLFU/fcWmnCLyXHC
 I6SucSiadKz/YicwqCYPvWpqu/KgmbeNce2UbIed/7m2Z3ZVJjj+I4yq/Y6+vk5/J+FY
 1vfHoT7TXYHKOESFpiudLPZeWVS+wvRjwFwN2qWPnFA8jmu2fOk4QKX7JcsuF9gwYKe7 Ag== 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMDQsIDIwMTkgYXQgMDI6NTA6NTdQTSArMDMwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiA+ICBlcnJvcjoKPiA+IC0JcHV0X2RldmljZSgmbHZkcy0+YmFja2xpZ2h0LT5k
ZXYpOwo+ID4gKwlpZiAobHZkcy0+YmFja2xpZ2h0KQo+ID4gKwkJcHV0X2RldmljZSgmbHZkcy0+
YmFja2xpZ2h0LT5kZXYpOwo+IAo+IEhvdyBhYm91dCBzaW1wbHkKPiAKPiAtCXB1dF9kZXZpY2Uo
Jmx2ZHMtPmJhY2tsaWdodC0+ZGV2KTsKPiArCWJhY2tsaWdodF9wdXQobHZkcy0+YmFja2xpZ2h0
KTsKClllYWguICBUaGF0J3MgY2xlYW5lci4gIEkgd2lsbCByZXNlbmQuCgpyZWdhcmRzLApkYW4g
Y2FycGVudGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
