Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A6D81E67F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Dec 2023 10:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2DB10E00B;
	Tue, 26 Dec 2023 09:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 327 seconds by postgrey-1.36 at gabe;
 Tue, 26 Dec 2023 09:42:06 UTC
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DB710E00B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Dec 2023 09:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1703583724; x=1704188524; i=markus.elfring@web.de;
 bh=7s7Czem3g9WjULia5nQz77gt2Cg/2yiGOV1liYLC2qQ=;
 h=X-UI-Sender-Class:Date:To:From:Subject:Cc;
 b=md4k7huEs/1eJ9OepKwBvgHkavUTK3UtLEYYBnJcUe/zRFt+4ArQqdbCKGtKOnIK
 3FN/qfsjaGQvjGbuY9f0swDj69THjYGdYFllFip5mJ6DnxsTZe7FQWrghmQhz8fkI
 2buPbl0kcDdgImHHU36j+ko04DBmqJV8t6tsAggzLnI3TBpYtw0CsfEHSckjgoiqB
 YfA+RwSLUO/DfRMVMoVox+F4VjpSp7nxr6J7pFC2SaLhTgDatSbDYXFWClIgQB1Rf
 +FMeo2gEOXJA+75570EMjhAkN0oYGOzMuxk22EXfHtHJl0N0Bl8pJ/CGbjW15XHTp
 oPee/vBn3D18OlbnYw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mmhnu-1qs6RZ3Cy6-00jyS5; Tue, 26
 Dec 2023 10:36:19 +0100
Message-ID: <ff7ce5d0-59fa-470c-8dd6-68dbe65c18e5@web.de>
Date: Tue, 26 Dec 2023 10:36:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH 0/3] drm: property: Adjustments for three function
 implementations
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DcL70u3CW7ium0TLeQa8v3pqMAuHd3U3ffavREKGtKtoIotqohU
 vVm/sRhXjJKwXOYQ9pFWJucZSe+994yhW2o0ijsxi6iHZ/Q0zgliCRzPJonYzGsCVBbzBz/
 0zNekbaZqRGP3FS8eocU6giczTt17vn0lz2CUyuIihbAwCRdssrlhFRRrdRUfkOPsL5/oRF
 eZxsilcj30qz1vpdWDsDg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jXVMJvSsLhc=;0fHUYYFzN4C1J6DGhZyjpQwf/Fo
 XZp/NOmmmO0OtxJn2l/yfkC7ELhlyfFMcL3xNthARpOpzfT5hTpUTseEv/ZLvcbqWMhci38fC
 heqsNSzNQ28p4SZ68lm0FmTwrDOLrbckxa/dcUewHltrV1B/uJHSp0805qsdEPu1Oe7mJger4
 uivAoSyHFVBDxE6oZKVGkHIcMTMCY6mC4WqVf/lJ17nLRSMPWQ+Pb+5Qcv/QvtTdLQ3AZ5ixq
 +GwXtEFZ8gQnGS717MsVUdTlcYCwj2PuJkBS2AjGBtgQF3gEdLhqb2G1dm/w9OadWJ8JVg5Df
 NTgPSXEmhbpq9i4wODGoR3Q/hxJPodznNThr1gP/nP5fJ47Zti9WPd3Sm5O0tFg07o09Q4Buw
 Ki7LT6Ci1sBmEXa2q+37K2NysK2M47i61yrRpJogdVPZXriXCGQ5wJw9yTlrNf6R2VLABsmu1
 O69jqaYLTl1Ww7j2vu/55rCjrRsXK54kMVZEDHNImy6xNPY+kBR071ONM2mOt1tgXYR5XZOtb
 jwni40cgOXswkjilWLjcd4ajlNt2M6WezlycyLClNShN12Kln4PB2KtxWfRU8KzeQd8ss9+pE
 KUVu2sxwXJJ4WsEaHfuXnikTMecx6a3CfNRjgwov/c7SBsjcgjDWNfo30Cz9IMwPVcs9q8Gcd
 Bys3ilmuIpv3TBx2zz1YUtp1AMI5thmvFcG68udWw1HG7D8imbxEqxgfoK8Aa1iJNNVWBJVdY
 HYwDLjDw2cl/FHwn01170tSq/hknMzcOFbNDSn1tlMWQUfXsA+ndyujtHyvGt+3i/KgWF2c9Y
 ZBadQFoRufGHeNInDtS8qv4MpqWOCEqMfGzexq3U623oPjhAuOkSQK6uoAvhTqToPzwC5Zq0R
 EO9mYK+GnndZU9wK0YspZSmDxjzozY3SskxjW8I6HJnp7Ufb5ngaDeQKBJ0SvTcVRv/FukUvZ
 GgwQOg==
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Dec 2023 10:26:36 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  One function call less in drm_property_create() after error detection
  Delete an unnecessary initialisation in drm_property_create()
  Improve four size determinations

 drivers/gpu/drm/drm_property.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

=2D-
2.43.0

