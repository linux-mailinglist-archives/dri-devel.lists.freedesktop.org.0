Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDCEED011
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2019 18:56:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A1C6E0C5;
	Sat,  2 Nov 2019 17:56:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C396E0C5;
 Sat,  2 Nov 2019 17:56:43 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o28so12718150wro.7;
 Sat, 02 Nov 2019 10:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i7MoedW7dYIqdxbz/1+3cfjIQ5/QgAvq64b2nX4h9Is=;
 b=uhmCDcV0ZqKQU9lmIp8jlJx5TXRyK3iYsHnSxThAI91E2zXXrJjMs/tfX5kjSyP872
 +bzldq58nTm6hIbI/zOzJwbPMnstgZirqPmeDv0zSgbes+CeThfglo/XTzPFXKcVE8L2
 bQb2nYw3xgq3WWKGHZg2NbVSSEu7anCejpYOGQHeKXSuFHa3URtAjjoPpD4aZogmXXT0
 KKoRHkU3hsqzIJSTfxa8vNrRW5SofYGJ0wADluaQ5tRlqaIFEfGIP6qRVrRJ90ovbRkh
 k050yLKTRvBjgeqIK08XilOEs8t0/5uKBDVfsm2Z7ZywKA8msehcsiagElpkAx/5nyez
 KczQ==
X-Gm-Message-State: APjAAAXo2hnT2HIPYDULXGeDzC0rAKn69ZXpGp0KQ3zkUK3m3XRRIpXz
 iwGbQlDFczWAUkUizTtqjakuvLrG
X-Google-Smtp-Source: APXvYqzJtlGVHlwL0v5kEn5rmK2IZ758Txlqib/YVhvasyLC3bmKjUtvK7n7igjNDNR9GVej52q1oA==
X-Received: by 2002:adf:f452:: with SMTP id f18mr16970783wrp.264.1572717402606; 
 Sat, 02 Nov 2019 10:56:42 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id d11sm13660495wrf.80.2019.11.02.10.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2019 10:56:41 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>,
	Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v2 1/9] iommu: Document iommu_fwspec::flags field
Date: Sat,  2 Nov 2019 18:56:29 +0100
Message-Id: <20191102175637.3065-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102175637.3065-1-thierry.reding@gmail.com>
References: <20191102175637.3065-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i7MoedW7dYIqdxbz/1+3cfjIQ5/QgAvq64b2nX4h9Is=;
 b=PBk/3eobuNc6BJ0Ju4MArus3AqqUABkAqnOepK32TX0MsTxcMzsoHqlIVHBVEzvLCI
 8SZ8ROh6sJtXTKpxO0B4M/eaLig2OEzfYpX0R9Z4OWKWTYhIHN4asp/qVhGzIl27Aq9h
 0XOd0JTV4VwYJf1k8lhb52FNfPoZj1g7oMLRJ6BzK9o3j7z+DvTCDJinEk2P8moOchQq
 Jedsv5tlbwJynGGYR+ItUTyJEeWgyeoOBlGmQRWD2IkmHqtmiFnZc3xXcEeZgA3ZYqcz
 b4s9wUskjXOkMSg/XXpG+MY8Xa5auIMl+MSpOg8E8aRhmLEXTMb0wsA/hLx4QKPc2d8z
 184Q==
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
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org,
 Ben Dooks <ben.dooks@codethink.co.uk>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCldoZW4gdGhpcyBmaWVs
ZCB3YXMgYWRkZWQgaW4gY29tbWl0IDU3MDJlZTI0MTgyZiAoIkFDUEkvSU9SVDogQ2hlY2sgQVRT
CmNhcGFiaWxpdHkgaW4gcm9vdCBjb21wbGV4IG5vZGVzIiksIHRoZSBrZXJuZWxkb2MgY29tbWVu
dCB3YXNuJ3QgdXBkYXRlZAphdCB0aGUgc2FtZSB0aW1lLgoKU2lnbmVkLW9mZi1ieTogVGhpZXJy
eSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L2lvbW11Lmgg
fCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvaW9tbXUuaCBiL2luY2x1ZGUvbGludXgvaW9tbXUuaAppbmRleCBlMjhlODBkZWEx
NDEuLjdiZjAzOGIzNzFiOCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9pb21tdS5oCisrKyBi
L2luY2x1ZGUvbGludXgvaW9tbXUuaApAQCAtNTcwLDYgKzU3MCw3IEBAIHN0cnVjdCBpb21tdV9n
cm91cCAqZnNsX21jX2RldmljZV9ncm91cChzdHJ1Y3QgZGV2aWNlICpkZXYpOwogICogQG9wczog
b3BzIGZvciB0aGlzIGRldmljZSdzIElPTU1VCiAgKiBAaW9tbXVfZndub2RlOiBmaXJtd2FyZSBo
YW5kbGUgZm9yIHRoaXMgZGV2aWNlJ3MgSU9NTVUKICAqIEBpb21tdV9wcml2OiBJT01NVSBkcml2
ZXIgcHJpdmF0ZSBkYXRhIGZvciB0aGlzIGRldmljZQorICogQGZsYWdzOiBJT01NVSBmbGFncyBh
c3NvY2lhdGVkIHdpdGggdGhpcyBkZXZpY2UKICAqIEBudW1faWRzOiBudW1iZXIgb2YgYXNzb2Np
YXRlZCBkZXZpY2UgSURzCiAgKiBAaWRzOiBJRHMgd2hpY2ggdGhpcyBkZXZpY2UgbWF5IHByZXNl
bnQgdG8gdGhlIElPTU1VCiAgKi8KLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
