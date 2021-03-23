Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0D0345B10
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 10:40:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2C76E87B;
	Tue, 23 Mar 2021 09:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338A36E87B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 09:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fswUoVYR7jgOyGK2YfYGz9wPES3A5x5fpDNjsV1l8Fc=; b=pMEnGdyqCpNvYj/+Hi+rRllPlW
 NLkEU4/sJrdAKM4JsFkn1LmPPb2aSAXzvKtf0KwNvnNoy+yqMyoT6vxKjzwrAQXfk9YzFcvvgZEzD
 RSqjIPIVVCqHZm3MRpeqduQvUB/oMG1YZFei1SnvAb+lxxOF3+Fl1bmF3I3RumV4DNdYhA10XUrYh
 /SSWQft49W9ch98kJWStX/kAlaRFsRAeaxAj+YW91gnCHdsyjO0cpYbm9+cJLzuD9bWgfG83vN7eK
 Br8WLJaVoUtJff0x6lh8hRcbig6mm/TZDHHZdNLF3N1LiSf6aZlkZKyK4fmXuN2de9nSlJwOMQhLP
 9A3oFvew==;
Received: from [2a01:799:95f:4600:cca0:57ac:c55d:a485] (port=53645)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lOdWC-0002AO-Sg; Tue, 23 Mar 2021 10:40:08 +0100
Subject: Re: [PATCH 1/2] drm/gud: fix sizeof use
To: dri-devel@lists.freedesktop.org
References: <20210322174434.58849-1-noralf@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <6a267726-8d4f-1ae0-e82c-70e3ab50abea@tronnes.org>
Date: Tue, 23 Mar 2021 10:40:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210322174434.58849-1-noralf@tronnes.org>
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
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjIuMDMuMjAyMSAxOC40NCwgc2tyZXYgTm9yYWxmIFRyw7hubmVzOgo+IEZyb206IGtl
cm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+IAo+IGRyaXZlcnMvZ3B1L2RybS9ndWQv
Z3VkX2Nvbm5lY3Rvci5jOjcxMDozNy00MzogRVJST1I6IGFwcGxpY2F0aW9uIG9mIHNpemVvZiB0
byBwb2ludGVyCj4gCj4gIHNpemVvZiB3aGVuIGFwcGxpZWQgdG8gYSBwb2ludGVyIHR5cGVkIGV4
cHJlc3Npb24gZ2l2ZXMgdGhlIHNpemUgb2YKPiAgdGhlIHBvaW50ZXIKPiAKPiBHZW5lcmF0ZWQg
Ynk6IHNjcmlwdHMvY29jY2luZWxsZS9taXNjL25vZGVyZWYuY29jY2kKPiAKPiBGaXhlczogNDBl
MWE3MGI0YWVkICgiZHJtOiBBZGQgR1VEIFVTQiBEaXNwbGF5IGRyaXZlciIpCj4gUmVwb3J0ZWQt
Ynk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IGtl
cm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+IFtmaXggc3ViamVjdF0KPiBTaWduZWQt
b2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KPiAtLS0KCkJvdGgg
cGF0Y2hlcyBhcmUgYXBwbGllZCB0byBkcm0tbWlzYy1uZXh0LgoKTm9yYWxmLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
