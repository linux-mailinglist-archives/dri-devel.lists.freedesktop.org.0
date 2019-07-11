Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A05A565FB0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 20:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355206E279;
	Thu, 11 Jul 2019 18:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18896E279;
 Thu, 11 Jul 2019 18:46:51 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id CDF5260E3F; Thu, 11 Jul 2019 18:46:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jeykumar-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jsanka@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 99BAA60E3F;
 Thu, 11 Jul 2019 18:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 99BAA60E3F
From: Jeykumar Sankaran <jsanka@codeaurora.org>
To: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, seanpaul@chromium.org, robdclark@gmail.com
Subject: [RFC] Expanding drm_mode_modeinfo flags 
Date: Thu, 11 Jul 2019 11:46:44 -0700
Message-Id: <1562870805-32314-1-git-send-email-jsanka@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1562870811;
 bh=Wcwypd2shfHXRN1F4mXhVFKFlMevSQTBgV1XmEcucRU=;
 h=From:To:Cc:Subject:Date:From;
 b=AU4gwqJxErfuXfgItx6xH8I+yK2wUcHK+770guwguGiZSl0mC5tEJ5OPGDDv9dphk
 skcWXU2dx0IAg7PsYut/kqNcOL7id2B4lgyfHodA5pR5oIlabaTl+TvtS1PaQqN1jw
 FdFrxlJFb5gwPNc+mjGUevAZGW39Yk/H8KzEw6Mw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1562870811;
 bh=Wcwypd2shfHXRN1F4mXhVFKFlMevSQTBgV1XmEcucRU=;
 h=From:To:Cc:Subject:Date:From;
 b=AU4gwqJxErfuXfgItx6xH8I+yK2wUcHK+770guwguGiZSl0mC5tEJ5OPGDDv9dphk
 skcWXU2dx0IAg7PsYut/kqNcOL7id2B4lgyfHodA5pR5oIlabaTl+TvtS1PaQqN1jw
 FdFrxlJFb5gwPNc+mjGUevAZGW39Yk/H8KzEw6Mw=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jsanka@codeaurora.org
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
Cc: pdhaval@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICAgIEhlbGxvIEFsbCwgCiAgICAJZHJtX21vZGVfbW9kZWluZm86OmZsYWdzIGlzIGEgMzIgYml0
IGZpZWxkIGN1cnJlbnRseSB1c2VkIHRvCiAgICBkZXNjcmliZSB0aGUgcHJvcGVydGllcyBvZiBh
IGNvbm5lY3RvciBtb2RlLiBJIHNlZSB0aGUgbGVhc3Qgb3JkZXIgMjIgYml0cwogICAgYXJlIGFs
cmVhZHkgaW4gdXNlLiBQb3N0aW5nIHRoaXMgUkZDIHRvIGRpc2N1c3Mgb24gYW55IHBvdGVudGlh
bCBwbGFucyB0byAKICAgIGV4cGFuZCB0aGUgYml0IHJhbmdlIHN1cHBvcnQgb2YgdGhpcyBmaWVs
ZCBmb3IgZ3Jvd2luZyBtb2RlIHByb3BlcnRpZXMgYW5kIAogICAgd2F5cyB0byBoYW5kbGUgb25l
IHN1Y2ggcHJvcGVydHkgbmVlZGVkIGJ5IHRoZSBtc20gZHB1IGRyaXZlci4KCiAgICBtc20gZHJp
dmVycyBzdXBwb3J0IHBhbmVscyB3aGljaCBjYW4gZHluYW1pY2FsbHkgc3dpdGNoIGJldHdlZW4K
ICAgIHZpZGVvKGFjdGl2ZSkgYW5kIGNvbW1hbmQoc21hcnQpIG1vZGVzLiBXaXRoaW4gdmlkZW8g
bW9kZSwgdGhleSBhbHNvIHN1cHBvcnQKICAgIHN3aXRjaGluZyBiZXR3ZWVuIHJlc29sdXRpb25z
IHNlYW1sZXNzbHkgaS5lLiBnbGl0Y2ggZnJlZSByZXNvbHV0aW9uIHN3aXRjaC4KICAgIEJ1dCB0
aGV5IGNhbm5vdCBkbyBhIHNlYW1sZXNzIHN3aXRjaCBmcm9tIGEgcmVzb2x1dGlvbnMgZnJvbSB2
aWRlbyB0bwogICAgY29tbWFuZCBvciB2aWNlIHZlcnNhLiBDbGllbnRzIG5lZWQgdG8gYmUgYXdh
cmUgZm9yIHRoZXNlIGNhcGFibGl0aWVzIGJlZm9yZQogICAgdGhleSBzd2l0Y2ggYmV0d2VlbiB0
aGUgcmVzb2x1dGlvbnMuIFNpbmNlIHRoZXNlIGNhcGFiaWxpdGllcyBhcmUgaWRlbnRpZmllZAog
ICAgcGVyIGRybV9tb2RlLCB3ZSBhcmUgY29uc2lkZXJpbmcgdGhlIGJlbG93IHR3byBhcHByb2Fj
aGVzIHRvIGhhbmRsZSB0aGlzCiAgICB1c2UgY2FzZS4KCiAgICBPcHRpb24gMToKICAgIEF0dGFj
aGVkIHBhdGNoIGFkZHMgZmxhZyB2YWx1ZXMgdG8gYXNzb2NpYXRlIGEgZHJtX21vZGUgdG8gdmlk
ZW8vY29tbWFuZAogICAgbW9kZSBhbmQgdG8gaW5kaWNhdGUgaXRzIGNhcGFiaWxpdHkgdG8gZG8g
YSBzZWFtbGVzcyBzd2l0Y2guCgogICAgT3B0aW9uIDI6CiAgICBkcm1fbW9kZV9tb2RlaW5mbyBj
YW4gZXhwb3NlIGEgbmV3ICJwcml2YXRlX2ZsYWdzIiBmaWVsZCB0byBoYW5kbGUgdmVuZG9yCiAg
ICBzcGVjaWZpYyBtb2RlIGZsYWdzLiBCZXNpZGVzIHRoZSBhYm92ZSBtZW50aW9uZWQgdXNlIGNh
c2UsIHdlIGFyZSBhbHNvCiAgICBleHBvbG9yaW5nIG1ldGhvZHMgdG8gaGFuZGxlIHNvbWUgb2Yg
b3VyIGRpc3BsYXkgcG9ydCByZXNvbHV0aW9uIHN3aXRjaCB1c2UKICAgIGNhc2VzIHdoZXJlIHRo
ZSBEUCBwb3J0cyBjYW4gYmUgb3BlcmF0ZWQgaW4gYSB0aWxlZC9kZXRpbGVkIG1vZGVzLiBUaGlz
IAogICAgYXBwcm9hY2ggd2lsbCBwcm92aWRlIGEgc3RhbmRhcmQgY2hhbm5lbCBmb3IgZHJtIGRy
aXZlciB2ZW5kb3JzIGZvciB0aGVpciAKICAgIGdyb3dpbmcgbmVlZCBmb3IgZHJtX21vZGUgc3Bl
Y2lmaWMgY2FwYWJpbGl0aWVzLgoKICAgIFBsZWFzZSBwcm92aWRlIHlvdXIgaW5wdXRzIG9uIHRo
ZSBvcHRpb25zIG9yIGFueSB1cHN0cmVhbSBmcmllbmRseQogICAgcmVjb21tZW5kYXRpb24gdG8g
aGFuZGxlIHN1Y2ggY3VzdG9tIHVzZSBjYXNlcy4KCiAgICBUaGFua3MgYW5kIFJlZ2FyZHMsCiAg
ICBKZXlrdW1hciBTLgoKSmV5a3VtYXIgU2Fua2FyYW4gKDEpOgogIGRybTogYWRkIG1vZGUgZmxh
Z3MgaW4gdWFwaSBmb3Igc2VhbWxlc3MgbW9kZSBzd2l0Y2gKCiBpbmNsdWRlL3VhcGkvZHJtL2Ry
bV9tb2RlLmggfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgotLSAK
VGhlIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIHRoZSBD
b2RlIEF1cm9yYSBGb3J1bSwKYSBMaW51eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRpdmUgUHJvamVj
dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
