Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F169E06D4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 16:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21726E83A;
	Tue, 22 Oct 2019 14:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1393 seconds by postgrey-1.36 at gabe;
 Tue, 22 Oct 2019 14:54:41 UTC
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07C66E83A;
 Tue, 22 Oct 2019 14:54:41 +0000 (UTC)
Received: from [2600:1700:4830:165f::19e] (port=59514)
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1iMvC0-0004ly-Cv; Tue, 22 Oct 2019 10:31:24 -0400
Subject: Re: [PATCH 4/5] drm/dsi: rename MIPI_DCS_SET_PARTIAL_AREA to
 MIPI_DCS_SET_PARTIAL_ROWS
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <cover.1571738674.git.jani.nikula@intel.com>
 <c14255c3cecea4d2c593ff4edd5e8134ab7568d3.1571738674.git.jani.nikula@intel.com>
From: David Lechner <david@lechnology.com>
Message-ID: <406d7ec4-f5b1-2ba4-a0ae-05fef4ab38b1@lechnology.com>
Date: Tue, 22 Oct 2019 09:31:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c14255c3cecea4d2c593ff4edd5e8134ab7568d3.1571738674.git.jani.nikula@intel.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+cLwW3UVJNS/Teo/naWypoxXBnxm1o/9QjXU9rmIbI0=; b=v8ID0VVLQOkIm8r9uE492nPWO+
 qhROf1IY6l3ULpOh0IN1by/ZGSt8lu9yy2u0A2a6Si7tsi6j/TGvgWUo18697QPwO/TtG38mEa4WM
 yhsdeNVN0aepDOKW5cpEinm1mxGeoHg7peMngbiEKORmnci1MrL1dsBPunmnIquRPOiXlAMlxcZef
 quUZlOEg/7ew4AiEnzWDrx3nF6mjStFfpgCquhiy15uN96eWqAJb6taK7UU6tJiz2Fnjs2oCXSj96
 8m7g/wzYt/OtZFTufvyl+CI6yTp4k/1VLq3sv/iA7STfCclJWhanVR8CaVnDH0hBYHr2vZ9/y4gma
 ku2AVYrg==;
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
Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>,
 intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMjIvMTkgNTowOSBBTSwgSmFuaSBOaWt1bGEgd3JvdGU6Cj4gVGhlIERDUyBjb21tYW5k
IGhhcyBiZWVuIG5hbWVkIFNFVF9QQVJUSUFMX1JPV1MgaW4gdGhlIERDUyBzcGVjIHNpbmNlCj4g
djEuMDIsIGZvciBtb3JlIHRoYW4gYSBkZWNhZGUuIFJlbmFtZSB0aGUgZW51bWVyYXRpb24gdG8g
bWF0Y2ggdGhlIHNwZWMuCj4gCj4gQ2M6IERhdmlkIExlY2huZXIgPGRhdmlkQGxlY2hub2xvZ3ku
Y29tPgo+IENjOiBWYW5kaXRhIEt1bGthcm5pIDx2YW5kaXRhLmt1bGthcm5pQGludGVsLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgo+IC0t
LQoKSSBndWVzcyBhbGwgb2YgbXkgZG9jdW1lbnRzIGFyZSBvbGQgYW5kIHNheSBzZXRfcGFydGlh
bF9hcmVhLCBidXQgSSB3aWxsCnRha2UgeW91ciB3b3JkIGZvciBpdC4KCkl0IGNvdWxkIGJlIGhl
bHBmdWwgdG8gbGVhdmUgYSBjb21tZW50IGluIHRoZSBjb2RlIGFib3V0IHRoZSByZW5hbWluZwpz
byB0aGF0IGlmIHBlb3BsZSB3aXRoIG9sZCBkb2NzIHNlYXJjaCBmb3IgU0VUX1BBUlRJQUxfQVJF
QSwgdGhleSBjYW4Kc3RpbGwgZmluZCBpdC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
