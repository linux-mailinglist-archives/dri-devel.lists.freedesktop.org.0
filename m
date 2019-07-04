Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1CE6026D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 10:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1F86E43F;
	Fri,  5 Jul 2019 08:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF116E390
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 16:31:33 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id d4so5890427edr.13
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2019 09:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=n8kTCu25pTvc0Y2/fueBvYl5zxx1RQ2B+7nWqH2z7y8=;
 b=smewZ9Ms5u8yc/D1BgrPjEZCxcy0c2xwpODAHb2oFCMqZHF9vj1iauTAHx51IJTnb5
 UVVvkXB+owQH47pe0PQgwPwweSkgWa1l2qdd+J3355xSY81zsEbT+MQq8hYiE9bmEu4R
 FaUIF5A0tWXbb3wfCVET7L14CEFIHooFa4QIcPKFPX/9punfthPkqvto7dIY5yO/PByw
 lWpJgASYzmI2i/zbojTGuc++zXNclPKgrTXn/FNUda52t9VrQda74YWN10k+BlaMGKP6
 e7DYAi+QsCWRORB4Vv5ZglkdPsrqb6G1z32KIGkmnHgRYhYWqDXwMAAvvBVegVJPvg/M
 644w==
X-Gm-Message-State: APjAAAWCdOt03Qb66mRwcpbiMAPjqq9dqT6Z9PA6i9fSsAycvL+nPHpi
 nqD/H3ibKlLIKnA60CGE5LQ=
X-Google-Smtp-Source: APXvYqw5vrckgTsSLFHHFv8WQnOVuCrCrmbp8zL3LEAjsFdeezIsagW27b8YRIBS2j0URbgzhDiCEA==
X-Received: by 2002:a50:ad0c:: with SMTP id y12mr48995203edc.25.1562257892139; 
 Thu, 04 Jul 2019 09:31:32 -0700 (PDT)
Received: from [10.10.2.174] (bran.ispras.ru. [83.149.199.196])
 by smtp.gmail.com with ESMTPSA id k51sm1822865edb.7.2019.07.04.09.31.31
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jul 2019 09:31:31 -0700 (PDT)
Subject: Re: [PATCH] drm/client: remove the exporting of drm_client_close
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20190703170150.32548-1-efremov@linux.com>
 <CACvgo52N5v07qA_afJfw7vo1X6_Gt4cGqBZn3eBzQtokndjWxA@mail.gmail.com>
From: Denis Efremov <efremov@linux.com>
Message-ID: <86ae7f09-bd79-b621-706c-0a7bff304aba@linux.com>
Date: Thu, 4 Jul 2019 19:31:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CACvgo52N5v07qA_afJfw7vo1X6_Gt4cGqBZn3eBzQtokndjWxA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 05 Jul 2019 08:41:20 +0000
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
Reply-To: efremov@linux.com
Cc: "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAKPiBPdXQgb2YgY3VyaW9zaXR5OiBEaWQgeW91IHVzZSBzb21lIHRvb2wgdG8gc3BvdCB0aGlz
Pwo+IAoKSnVzdCByZWd1bGFyIGV4cHJlc3Npb25zOgpodHRwczovL2dpdGh1Yi5jb20vZXZkZW5p
cy9leHBvcnRfY2hlY2tpbmcKCkJ1dCBpdCdzIG5vdCB2ZXJ5IHJlbGlhYmxlIGJlY2F1c2Ugb2Yg
ZmFsc2UgcG9zaXRpdmVzLiBJIHRoaW5rIEkgY2FuIHRyeQp0byBpbXBsZW1lbnQgdGhpcyBraW5k
IG9mIGNoZWNrIGFzIGEgcGFydCBvZiBtb2Rwb3N0IGluIGFkZGl0aW9uIHRvCkNPTkZJR19ERUJV
R19TRUNUSU9OX01JU01BVENILgoKRGVuaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
