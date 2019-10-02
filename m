Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E11BC87B0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 14:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8372894C0;
	Wed,  2 Oct 2019 12:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BCD894C0;
 Wed,  2 Oct 2019 12:01:59 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1Ma1wa-1iaceH2QCq-00W25Y; Wed, 02 Oct 2019 14:01:49 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 0/6] amdgpu build fixes
Date: Wed,  2 Oct 2019 14:01:21 +0200
Message-Id: <20191002120136.1777161-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:LX1FNtvLcwDIdLB+i4qzflq2ZYlCE6KB5K5rZJynUoqPGyIkUPY
 4Mz6djh6520XrlLSv3g57aFtMwJKS+y9hLWUvZH12eQqTQeiw1qnt1FSbmj6CTyowpdYqE0
 WuhmsmWfyydswcAYpuzkFYUaxnI42aBCHE/yPsUVi8yz+hz+FKV6WtoLKY7ceGsBXWg2p0a
 9ac7GLueW+ohA1srPf4fg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AqG46Q0Fqto=:DiGthsIlGZVRMpN4RTeFID
 MzWbk55Uax7YvMfxb5flyijER5Y97yOw9nqFFa9gNvalWz1RX1Smch6ciGu18NmJHcqo0vQsz
 4l/7L3Zvi6eStA4nSOz8V/J4DiViiY8LkeqfzJrxOO/NVKP8Djf4M08+BnRnqk5CJ3v5zd8hX
 QDoE81CpQZCCZuwnDM94TI6hsfxnv4uRj6UmodLtuWn8ouOUWQ3BvNTa42LLs0PFgd3aPvy3R
 ZuGilRa/9oD9CHqYxJZCaVKtFi71PHznXaZTTotzR71MEgICxHUtFhHLRr3Ti2PnseiC1Zf1K
 6sWSVtmTkJAn4LkBU9/Apur7egleGe3RjtTIwURZP6M7wWuZJ/WKoeaigTXtryVTgwsIJD0lF
 Os8EmR+Ea6imlxUnoAli7g16cVWBTGco29yJHZ01a0bR6A4b6YxOx5/EkMZo9RyZFqOEAx6aj
 Ip/4JP2jXmrZl8f2218bFr7WKMXq0THxulwMq7BTOx4IU0aaNX0JPEO4WIIUE/1zpr1W60SnB
 WPcojRp9/gFMVUYeeYbVjhYIlXE/vE2/zUKjzcaszN/nLpQtWiDhWUaH7FRDAJNSnzXjp0fKF
 g9s4vuuiPGigbTT0maHwmZ5KjCe8Zbkk6d2MxiUk9m+2a7vUjdRcYd+x8ELkQE8uWqyHmwpav
 TBjAZiHYmqsMEV6OeAKSBplfwhfU3DRHKUI13FEH10G+ymiGpst8RDBbYVvvpeXS5WrojWn8f
 hNa3V2lvlNUuESik+LKIqAzocxOERxp4NcosOxZpY+79kYf+k8dylDD6cCFSdaMNoQpLUNmFM
 qBFAdKa8Y9BJi7eFpoDMujcFwwBTjBTJwwfnSoSKe0C/+UQ303ozpFPAqr2bgMjmIqx1058AK
 tFDKQ930L4atVk7VQzEA==
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
Cc: clang-built-linux@googlegroups.com, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVyZSBhcmUgYSBjb3VwbGUgb2YgYnVpbGQgZml4ZXMgZnJvbSBteSBiYWNrbG9nIGluIHRoZSBy
YW5kY29uZmlnCnRyZWUuIEl0IHdvdWxkIGJlIGdvb2QgdG8gZ2V0IHRoZW0gYWxsIGludG8gbGlu
dXgtNS40LgoKICAgICBBcm5kCgpBcm5kIEJlcmdtYW5uICg2KToKICBkcm0vYW1kZ3B1OiBtYWtl
IHBtdSBzdXBwb3J0IG9wdGlvbmFsLCBhZ2FpbgogIGRybS9hbWRncHU6IGhpZGUgYW5vdGhlciAj
d2FybmluZwogIGRybS9hbWRncHU6IGRpc3BsYXlfbW9kZV92YmFfMjE6IHJlbW92ZSB1aW50IHR5
cGVkZWYKICBkcm0vYW1kL2Rpc3BsYXk6IGZpeCBkY24yMSBNYWtlZmlsZSBmb3IgY2xhbmcKICBb
UkVTRU5EXSBkcm0vYW1kL2Rpc3BsYXk6IGhpZGUgYW4gdW51c2VkIHZhcmlhYmxlCiAgW1JFU0VO
RF0gZHJtL2FtZGdwdTogd29yayBhcm91bmQgbGx2bSBidWcgIzQyNTc2CgogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jICAgICAgICAgICAgICB8ICAxICsKIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgICAgICAgICAgICAgICAgICB8ICAyIC0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jICAgfCAgMiAr
KwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL01ha2VmaWxlICAgICAgIHwg
MTIgKysrKysrKysrKystCiAuLi4vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjIxL2Rpc3BsYXlfbW9k
ZV92YmFfMjEuYyAgfCAxMyArKysrKy0tLS0tLS0tCiA2IGZpbGVzIGNoYW5nZWQsIDIwIGluc2Vy
dGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
