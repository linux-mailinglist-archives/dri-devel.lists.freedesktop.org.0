Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17856357CE
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 09:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228DF895B9;
	Wed,  5 Jun 2019 07:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A622C89453
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 05:07:17 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2MzN9Qq6uM="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.22 DYNA|AUTH)
 with ESMTPSA id i01b98v55573A1A
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 5 Jun 2019 07:07:03 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, tomi.valkeinen@ti.com,
 imirkin@alum.mit.edu, marek.belisko@gmail.com
Subject: [PATCH v2 0/2] drm/panel-simple: Add panel parameters for
 ortustech-com37h3m05dtc/99dtc and sharp-lq070y3dg3b
Date: Wed,  5 Jun 2019 07:07:01 +0200
Message-Id: <cover.1559711222.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Jun 2019 07:33:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1559711235; 
 s=strato-dkim-0002; d=goldelico.com;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=9HrfA+nGUIofb4uzcr10lyOFJZGIK/MX9HZYtnlp2N0=;
 b=ElERtda7iqaP2WErcMA3lqAR2UgNIoEMwQkRUceda1Cx35vWfW+yK+BUnWhOpeUute
 lyiRmeaVxWytwBj8HSqRRfq44c9ufUoz6V3KF2BpIe1vwd+O7gvVr/DE/F+rFWtVdEEX
 LGqY9uw0auVxmAXRbp85slyYo5MzS21bpwdoQKZYGwEcaryuY1oiGrdzKurrD1uJr/Tv
 KUFlHN3CTzdvk4WmIiTZkpotrkaQiM10gw8r473uTGPYTL/RoJCatSATrHiQyuD2bN2W
 ZBYSnwXqVccUFPbLhse7VFX3c7BbpVT0kXzyjgRi5bgLS0vlBIzBm+9q4Zdyg2Rm3v8U
 7ZTA==
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
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, letux-kernel@openphoenux.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VjI6CiogZml4IHR5cG8gaW4gOTlkdGMgcGFuZWwgY29tcGF0aWJsZSBzdHJpbmcgKHJlcG9ydGVk
IGJ5IGltaXJraW5AYWx1bS5taXQuZWR1KQoKVjE6CgpTaW5jZSB2NS4yLXJjMSBPTUFQIGlzIG5v
IGxvbmdlciB1c2luZyBhIHNwZWNpYWwgZGlzcGxheSBkcml2ZXIgYXJjaGl0ZWN0dXJlCmZvciBE
UEkgcGFuZWxzLCBidXQgdXNlcyB0aGUgZ2VuZXJhbCBkcm0vcGFuZWwvcGFuZWwtc2ltcGxlLgoK
U28gd2UgZmluYWxseSBjYW4gYWRkIFNvQyBpbmRlcGVuZGVudCBwYW5lbCBkZWZpbml0aW9ucyBm
b3IgdHdvIHBhbmVsIG1vZGVscwp3aGljaCB3ZSBhbHJlYWR5IGhhZCB3b3JrZWQgb24gcXVpdGUg
YSB3aGlsZSBhZ28gKGJlZm9yZSBkZXZpY2UgdHJlZSB3YXMKaW50cm9kdWNlZCk6CgoJaHR0cHM6
Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8yODUxMjk1LwoKCgpILiBOaWtvbGF1cyBTY2hh
bGxlciAoMik6CiAgZHJtL3BhbmVsOiBzaW1wbGU6IEFkZCBTaGFycCBMUTA3MFkzREczQiBwYW5l
bCBzdXBwb3J0CiAgZHJtL3BhbmVsOiBzaW1wbGU6IEFkZCBPcnR1c3RlY2ggQ09NMzdIM00gcGFu
ZWwgc3VwcG9ydAoKIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8IDYzICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2MyBpbnNlcnRpb25z
KCspCgotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
