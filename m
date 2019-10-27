Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED801E6E25
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:25:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DE56E4A6;
	Mon, 28 Oct 2019 08:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CE589F97
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2019 20:03:33 +0000 (UTC)
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.56.174]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MPrwQ-1iKx8y0zCs-004zFJ; Sun, 27
 Oct 2019 21:03:22 +0100
References: <20191027173234.6449-1-navid.emamdoost@gmail.com>
Subject: Re: [PATCH] drm/tinydrm: Fix memory leak in hx8357d_probe()
To: Navid Emamdoost <navid.emamdoost@gmail.com>,
 dri-devel@lists.freedesktop.org
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <7c45d721-af24-c31a-173a-d87a05ffd342@web.de>
Date: Sun, 27 Oct 2019 21:03:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191027173234.6449-1-navid.emamdoost@gmail.com>
Content-Language: en-US
X-Provags-ID: V03:K1:2Uj/OCsxenX0biaM2oE4wV2qc4T27dpJlSTHlNTz7Z4iG846IKA
 OxasXWP/drsebNmZmT9tQ5shc0MEx8ALi6LTz2okUSnvbkFzG5gZ/D4YHaGRMLHiNDjs9xJ
 NkL46kXAjIFDOLXXVY+E7hkieyu0Qw8Z0lODUm40o9zP3B8ji/2yHsJ+R8i/6AjFYTLP+1d
 R96YLMrkQMF0/HVVOLJAA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gU2QcMyNRLA=:XZYuiVChF7Rsqu1iXGTWBS
 mv0jFAjF4rJBeEGzOW/TIYfOVuD1DEL3Bf9kOfT5/P/4ZRpUU6cpU3etr+I6PRGsiturQBqwS
 b/CKPudDi6GTXZhuBkFVrhI6XI8tCWf4BgzqCC5ALaWaaaTaQ2nk42icMtZAG1dVvgnwC4yck
 hf+B0vw4kXm11tEgDjbNul3rEPAXM1vVIZN7B/5AABdBgr9oEavONIrqBVzMwjzUod3MFev+S
 NPklaz5X+7zRY1B/WfvEpBV+yd0DAhveFJ348OFDgiJh1W3sHsJbOFZ7fTM3VYXw9Rfuy3lfw
 XdtenoEV9qRVBXrDqh4A3IJAmkTZhGsLc1ed6QvBden/YTu1dAnGjmn6ejAOu1KunInDLONa5
 /70q+FRdVIW8TEXMckABgr2IgsbVCW6M57Ji/DjNhubc54Qsz36do98ZtqDyFqA4Rxi2RY9+Q
 hqdlrRTeJYVaeHizlu2/RxTswezAk1kSwC5IHgUR/wspjPdTHkDV4yiJ/53s3+ysuk/BbxYsR
 Mgt1vLPa09C0W01B+WRB6PfRGqKiBoQBrEqilj9Qe3M+cN6k1lQD06QZ6A6oaAuW7lP67H55V
 bN4VLAEu+jYZxo209dWUXkxCICfdia3qoyKu3ZRe/5Q2rk154W0ft63vdpGTVCuuXqigaHA56
 VOu/JIwjZayl4fdUSlGUlJqsIGPjCJA2oeKABe74vKk7NjjBDqP+0Hq2OUllIsQytdDxspEKw
 UUCbSEmrDI8tmThiWt1j0CAC1uA7kgibHzCSNtSYIpDcaCH6PjdFn3rbKhdwR9Ek8loPoNdLH
 6Pp0O+I8cmWEcmc7VYYj/SP8uWPSEi+m92tK0K1a1DS08tHUoZTFqJYblMla1ZsK/q5jNhJk6
 ZYgbVwM8+RXU1VHz4Ze7YSHNMdGNpQF7+XYCEoXsMVDm+LYvXM2Op8fSErzcmodLCEnadAYPf
 M76laNbAwxr7gIVZVkZBJOYP3AUtMKQZnIMgIfmzXW9ywJQgLNxOs9gFpWlyHxKvlZ7JlRWhn
 Eurtmr66dIdpiL9cSkO/o3qQ4xY3bLZrteL07RsqFEIBBdZTVyP2Ul/Ec3MtUTm/G71C9+oHe
 Qir1EVs7p234xe8156DgwA5Z5/CNvMToA44yHY4Z0MuVhakAHPhH8E/TGGjPQN3eB20owLGmJ
 v3xpseL0pQw8/TMt4muX7YI7+nU6Lbl4trS/p/gT9m34m8nZnc5MZY5W0WrPAig8KnJCEzkOp
 cYJxDeduHX9vI77ndkqEUZID0RZKav/0ei1Naq+p4I7uC+mX0vQwF1qTg/Uc=
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:23:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=web.de; s=dbaedf251592; t=1572206602;
 bh=5raUnm8mPTDz7MAgkaZvaJhgukfSfQNUq5CbRJt/jUk=;
 h=X-UI-Sender-Class:Cc:References:Subject:To:From:Date:In-Reply-To;
 b=lAx37udbtRcmVgVKYpB6CytcgCiwPyfgFXfOulVvOWsf8ozkqk3+Usc9gJL4j4hg2
 /1EY/4dMJeodill3lXyl6O9+Zwj3C1tEUVdIz/bzxIpZqptesuHvbrnoSbx1BTBmM3
 bms+u/1gQrPybGElWMcOUiibq/xOEZ4acr2xXSe0=
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>,
 Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGxlYXNlIGF2b2lkIGFsc28gYW5vdGhlciB0eXBvIGluIHRoZSAocHJldmlvdXMpIHBhdGNoIHN1
YmplY3QuCgpSZWdhcmRzLApNYXJrdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
