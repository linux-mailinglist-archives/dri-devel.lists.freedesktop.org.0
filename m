Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4995D75C3A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 02:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E3F6E83F;
	Fri, 26 Jul 2019 00:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C011B6E83D;
 Fri, 26 Jul 2019 00:56:55 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d3a4fd70000>; Thu, 25 Jul 2019 17:56:55 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 25 Jul 2019 17:56:55 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 25 Jul 2019 17:56:55 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Jul
 2019 00:56:55 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Jul
 2019 00:56:54 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 26 Jul 2019 00:56:54 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5d3a4fd60000>; Thu, 25 Jul 2019 17:56:54 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-mm@kvack.org>
Subject: [PATCH v2 0/7] mm/hmm: more HMM clean up
Date: Thu, 25 Jul 2019 17:56:43 -0700
Message-ID: <20190726005650.2566-1-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1564102616; bh=5+MT9OBADQ1SPlqa4lbGtzxIR+MyjShmpHu800z/6QY=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:X-NVConfidentiality:Content-Type:
 Content-Transfer-Encoding;
 b=YuFWjX012+NgjLM9Bm4Tl9N6DrjrA2qBJ8XfMLtek1xIKcwAlW2zTR7ZBopoYELCY
 qq0y0XlrVhbGJ6bBZHliXVLop7L0xtDhK3U8CINQGLzvkB5pD+o97C6FGz3F6w/Y+V
 7Aw/qj+1tk977HV5Pp/V8fHOawl344UIfDB5VagbgnrLiYsock1yoxRDIWMnvtcIiV
 7yN6j2R9JWSd4G+IyKVyK7+jmk/6h9RlvhGC+nkCxxT7SIa8eHwU2SzryIf1Ql82Qa
 L3F083tLofkQ7gF9r/Wy3jeqyW8Q8xLCmPBJzzzv7BUC1SgdLrE5m0tn2mPCebXchj
 lGqghDh3XCyJA==
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Ralph
 Campbell <rcampbell@nvidia.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVyZSBhcmUgc2V2ZW4gbW9yZSBwYXRjaGVzIGZvciB0aGluZ3MgSSBmb3VuZCB0byBjbGVhbiB1
cC4KVGhpcyB3YXMgYmFzZWQgb24gdG9wIG9mIENocmlzdG9waCdzIHNldmVuIHBhdGNoZXM6CiJo
bW1fcmFuZ2VfZmF1bHQgcmVsYXRlZCBmaXhlcyBhbmQgbGVnYWN5IEFQSSByZW1vdmFsIHYzIi4K
SSBhc3N1bWUgdGhpcyB3aWxsIGdvIGludG8gSmFzb24ncyB0cmVlIHNpbmNlIHRoZXJlIHdpbGwg
bGlrZWx5IGJlCm1vcmUgSE1NIGNoYW5nZXMgaW4gdGhpcyBjeWNsZS4KCkNoYW5nZXMgZnJvbSB2
MSB0byB2MjoKCkFkZGVkIEFNRCBHUFUgdG8gaG1tX3VwZGF0ZSByZW1vdmFsLgpBZGRlZCAyIHBh
dGNoZXMgZnJvbSBDaHJpc3RvcGguCkFkZGVkIDIgcGF0Y2hlcyBhcyBhIHJlc3VsdCBvZiBKYXNv
bidzIHN1Z2dlc3Rpb25zLgoKQ2hyaXN0b3BoIEhlbGx3aWcgKDIpOgogIG1tL2htbTogcmVwbGFj
ZSB0aGUgYmxvY2sgYXJndW1lbnQgdG8gaG1tX3JhbmdlX2ZhdWx0IHdpdGggYSBmbGFncwogICAg
dmFsdWUKICBtbTogbWVyZ2UgaG1tX3JhbmdlX3NuYXBzaG90IGludG8gaG1tX3JhbmdlX2ZhdWx0
CgpSYWxwaCBDYW1wYmVsbCAoNSk6CiAgbW0vaG1tOiByZXBsYWNlIGhtbV91cGRhdGUgd2l0aCBt
bXVfbm90aWZpZXJfcmFuZ2UKICBtbS9obW06IGEgZmV3IG1vcmUgQyBzdHlsZSBhbmQgY29tbWVu
dCBjbGVhbiB1cHMKICBtbS9obW06IG1ha2UgZnVsbCB1c2Ugb2Ygd2Fsa19wYWdlX3JhbmdlKCkK
ICBtbS9obW06IHJlbW92ZSBodWdldGxiZnMgY2hlY2sgaW4gaG1tX3ZtYV93YWxrX3BtZAogIG1t
L2htbTogcmVtb3ZlIGhtbV9yYW5nZSB2bWEKCiBEb2N1bWVudGF0aW9uL3ZtL2htbS5yc3QgICAg
ICAgICAgICAgICAgfCAgMTcgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9t
bi5jICB8ICAgOCArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwg
ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jICAgfCAgMTMgKy0K
IGluY2x1ZGUvbGludXgvaG1tLmggICAgICAgICAgICAgICAgICAgICB8ICA0NyArKy0tCiBtbS9o
bW0uYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAzNDAgKysrKysrKystLS0tLS0t
LS0tLS0tLS0tCiA2IGZpbGVzIGNoYW5nZWQsIDE1MCBpbnNlcnRpb25zKCspLCAyNzcgZGVsZXRp
b25zKC0pCgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
