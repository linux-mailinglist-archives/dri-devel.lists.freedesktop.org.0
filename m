Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16804F9608
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 17:52:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE906EB7A;
	Tue, 12 Nov 2019 16:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0246EB83;
 Tue, 12 Nov 2019 16:52:22 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id C891F60850; Tue, 12 Nov 2019 16:52:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 60E3C6053B;
 Tue, 12 Nov 2019 16:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 60E3C6053B
Date: Tue, 12 Nov 2019 09:52:18 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [Freedreno] [PATCH RESEND] drm/msm/adreno: Do not print error on
 "qcom, gpu-pwrlevels" absence
Message-ID: <20191112165218.GA14014@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Fabio Estevam <festevam@gmail.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 Sean Paul <sean@poorly.run>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Chris Healy <cphealy@gmail.com>
References: <20191015134012.15165-1-festevam@gmail.com>
 <CAOCk7NpoGA8VmTXSk96VxVtGU2yFs0+n8wyBeQkvwR8HZSOCRQ@mail.gmail.com>
 <CAOMZO5AnZ2dhgxsLVUSDqSGcPH8T1yOABWrqEniKotONTR29fw@mail.gmail.com>
 <20191101145209.GA16446@jcrouse1-lnx.qualcomm.com>
 <CAOMZO5ADoav=-6ZMn-C=7UA0Fz96BVyitSYeAsn+kxf8HBzZ2g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMZO5ADoav=-6ZMn-C=7UA0Fz96BVyitSYeAsn+kxf8HBzZ2g@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1573577541;
 bh=Len64tbx0Cw9kAJN3Nrjvke2HLMhkWH1LU65XB4hhL4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WoAXmDocN6yiW89OMmckHpuHecY4jxoJoAdbWo6viyUARqFm15ZamojtOb5+nAIhM
 /U4ttrnC385zlmhVvkpvhwo/SYOon/5asJoBKwfcZIbW0M91n67Tq6YjjEAQJji8q3
 UXbhlTJAoUW7ICOWuiPBtEDxkLPNhrQnCtBvMlF4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1573577541;
 bh=Len64tbx0Cw9kAJN3Nrjvke2HLMhkWH1LU65XB4hhL4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WoAXmDocN6yiW89OMmckHpuHecY4jxoJoAdbWo6viyUARqFm15ZamojtOb5+nAIhM
 /U4ttrnC385zlmhVvkpvhwo/SYOon/5asJoBKwfcZIbW0M91n67Tq6YjjEAQJji8q3
 UXbhlTJAoUW7ICOWuiPBtEDxkLPNhrQnCtBvMlF4=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
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
Cc: Jonathan Marek <jonathan@marek.ca>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Sean Paul <sean@poorly.run>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMDE6NDA6MjJQTSAtMDMwMCwgRmFiaW8gRXN0ZXZhbSB3
cm90ZToKPiBIaSBKb3JkYW4sCj4gCj4gT24gRnJpLCBOb3YgMSwgMjAxOSBhdCAxMTo1MiBBTSBK
b3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPiB3cm90ZToKPiAKPiA+IEknbSBn
b29kIHdpdGggdGhpcy4gVGhpcyByZWFsbHkgc2hvdWxkIG9ubHkgYmUgYXJvdW5kIGZvcgo+ID4g
Y29tcGF0aWJpbGl0eSB3aXRoIGRvd25zdHJlYW0gZGV2aWNlIHRyZWUgZmlsZXMgd2hpY2ggc2hv
dWxkIG1lYW4gbm90aGluZyBmb3IKPiA+IEkuTVg1Lgo+IAo+IE1heSBJIHJlc2VuZCBpdCB3aXRo
IHlvdXIgUmV2aWV3ZWQtYnkgdGFnPwoKT2YgY291cnNlLgoKSm9yZGFuCi0tIApUaGUgUXVhbGNv
bW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIgb2YgQ29kZSBBdXJvcmEgRm9y
dW0sCmEgTGludXggRm91bmRhdGlvbiBDb2xsYWJvcmF0aXZlIFByb2plY3QKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
