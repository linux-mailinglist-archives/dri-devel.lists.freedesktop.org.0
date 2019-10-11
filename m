Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA305D3D52
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 12:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A171A6EC0A;
	Fri, 11 Oct 2019 10:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A479B6EC0A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 10:27:45 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9BAO55M188694;
 Fri, 11 Oct 2019 10:27:32 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2vek4r0p5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Oct 2019 10:27:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9BAPrKo097601;
 Fri, 11 Oct 2019 10:27:32 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2vjdykqb79-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Oct 2019 10:27:32 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9BARMgi017104;
 Fri, 11 Oct 2019 10:27:22 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 11 Oct 2019 10:27:21 +0000
Date: Fri, 11 Oct 2019 13:27:11 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v2 0/2] Add initial support for slimport anx7625
Message-ID: <20191011102711.GP13286@kadam>
References: <cover.1570760115.git.xji@analogixsemi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1570760115.git.xji@analogixsemi.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9406
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910110099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9406
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910110099
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=Q+0VIr151B1mn8oR6VfAD9KdaxNSMZsIBKXR7z/rOdE=;
 b=jO3L995q1kkhqBcUj9rOzRGx05DgAsVSKEbaBs5Lb9IiAZoI2Af4gHePVpomAhxBWWyQ
 9RlOX1nWekuadvnoOeG9d5tyCkm8Y1zUrcPvBrFrikWGS1zpaxVtau9UlcCWp4rzKORT
 K6QTr44dbHHIxQ7v0r7K9iV+cm3W2QyOjRkAgCLagUacxojECxLJt7CeDUWDmxttevg5
 vRj8JTMyw7mFaCrumI5xpEQN7Ncx85ajwIJfG9lR8tQZGxzUo9oDHwHagV5SW/Zn+8YU
 DYjZ4DaJXNrsCGJfUvE1XsIW2dkrgmpgHoHWEJ5ndWuR51eD3PZADJrGreNslHF7Q8wW Ig== 
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
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDI6MjA6NDdBTSArMDAwMCwgWGluIEppIHdyb3RlOgo+
IEhpIGFsbCwKPiAKPiBUaGUgZm9sbG93aW5nIHNlcmllcyBhZGQgaW5pdGlhbCBzdXBwb3J0IGZv
ciB0aGUgU2xpbXBvcnQgQU5YNzYyNSB0cmFuc21pdHRlciwgYQo+IHVsdHJhLWxvdyBwb3dlciBG
dWxsLUhEIDRLIE1JUEkgdG8gRFAgdHJhbnNtaXR0ZXIgZGVzaWduZWQgZm9yIHBvcnRhYmxlIGRl
dmljZS4KPiAKPiBUaGlzIGlzIHRoZSBpbml0aWFsIHZlcnNpb24sIGFueSBtaXN0YWtlcywgcGxl
YXNlIGxldCBtZSBrbm93LCBJIHdpbGwgZml4IGl0IGluCj4gdGhlIG5leHQgc2VyaWVzLgo+IAo+
IFRoYW5rcywKPiBYaW4KPiAKCkknbSBub3QgYSBkb21haW4gZXhwZXJ0IGJ1dCBJIGxpa2UgdGhl
c2UgcGF0Y2hlcyBub3cuCgpSZXZpZXdlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRl
ckBvcmFjbGUuY29tPgoKcmVnYXJkcywKZGFuIGNhcnBlbnRlcgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
