Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE9CD2139
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 08:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A116EA98;
	Thu, 10 Oct 2019 06:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.ucr.edu (mx1.ucr.edu [138.23.248.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2313F6EA89
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 05:10:03 +0000 (UTC)
IronPort-SDR: QwLOPX33H8HwThcgUXZf3kvBlyg5egjyoyWqCpAztlcIpXj++ZwYfoiW1jJvtv6PpCClRNmL8r
 hMDeRQRTNAKFRsraWXw8RizNF4gDXBYzAay+m3KL7FHFLp2iT6lqTaGKvY1WbVT0CSC5yyzTbl
 lHqwLdWzVW/+AkCvf6OPl1mPXKOuZO1iwPdFNDJois8LyUf//IXBCRKugJH1bDjNx9HKJPsd0D
 yVebqIB9j6TqzZzEFsDQbvTrm6WBwCd3i9gQZTL1R9ZWYyg4lg6XTCmCbLz9YS+eyVwHVSq90h
 fwc=
IronPort-PHdr: =?us-ascii?q?9a23=3AiXpDEhJf6IqF/nNb+9mcpTZWNBhigK39O0sv0r?=
 =?us-ascii?q?FitYgXK/X/rarrMEGX3/hxlliBBdydt6sfzbSM+PG6EUU7or+5+EgYd5JNUx?=
 =?us-ascii?q?JXwe43pCcHRPC/NEvgMfTxZDY7FskRHHVs/nW8LFQHUJ2mPw6arXK99yMdFQ?=
 =?us-ascii?q?viPgRpOOv1BpTSj8Oq3Oyu5pHfeQpFiCezbL9oLRi6swrdu80IjYB/Nqs/1x?=
 =?us-ascii?q?zFr2dSde9L321oP1WTnxj95se04pFu9jlbtuwi+cBdT6j0Zrw0QrNEAjsoNW?=
 =?us-ascii?q?A1/9DrugLYTQST/HscU34ZnQRODgPY8Rz1RJbxsi/9tupgxCmXOND9QL4oVT?=
 =?us-ascii?q?i+6apgVQTlgzkbOTEn7G7Xi9RwjKNFrxKnuxx/2JPfbIWMOPZjYq/RYdYWSG?=
 =?us-ascii?q?xcVchTSiNBGJuxYIQPAeQPPuhWspfzqEcVoBuiGQWhHv/jxiNUinL026Axzu?=
 =?us-ascii?q?QvERvB3AwlB98BsnXUrdT1NKcPVuC+0arHzTXZYPNXxDzw74jJcxEhof6WXL?=
 =?us-ascii?q?J8bdbdxEc0GgPYklqQs5bpMC2I2eQQqmWW6fdrW+G3i2M/tQ19vjyiyt0vh4?=
 =?us-ascii?q?TJnI4Z11HJ+CdjzIs3ONG1TlNwb8S+H5tKrS6aMpN7QsYlQ251pik30qYGuZ?=
 =?us-ascii?q?unfCgSz5Qn2gLfZ+SHc4eW5hLjU/6cITJii3JkfLKznhKy8Ua9xuHlWMm50k?=
 =?us-ascii?q?tGojBKktnLsXAN2BjT5dadRvRh+Ueh3C6D1wHV6u5aPUA5jbTXJ4Ilz7IqlZ?=
 =?us-ascii?q?cesV7PEjL3lUj0lqObdFgo9vCt6+v9Y7XmopGcN5VzigH7Kqkvms2+AeQiPQ?=
 =?us-ascii?q?gPQ2SX5eqx2ab+/ULlWrVGlOM5nbTEsJzCP8QUura5AxNJ0oYk8xuwEi2m0N?=
 =?us-ascii?q?UBkXYaMl1FZgyIj4zyNlHKIfD4Fuu/g0+2nDdl3fDJIKPuDYjTIXjYk7fhYb?=
 =?us-ascii?q?F961ZGxAo019Bf6MEcNrZUCfb+SgfducHTDhIje1i9x+v3AdNx25lYVW+SCa?=
 =?us-ascii?q?+UKovbtFPO7eUqda3ET48PuS3hKvEj0N1wi3420QsWfbOoxocWYXb+HfNrJU?=
 =?us-ascii?q?SWSXPpjpEKFmJc+kJ0YOX0iVHKERVTenCXXqQzp3kJCIW7R8+XaomzgbDYmh?=
 =?us-ascii?q?W7GYB+b2VKTFuLFCGsP6mNRfYAIAuTOMtgn3RQXLm7T44s2TmqtQnn2/xmI7?=
 =?us-ascii?q?yQsgERs5Pu0JBL6vHPmAt6oTB9CcWQ10mDQX5wmiUDR2lylJt2pARHw0mF26?=
 =?us-ascii?q?9ijLQMDtVWz+lATAEwMoTTietgBIa2Ei/fd9HBcUuvRJ3yDC84SJQo3tYIS0?=
 =?us-ascii?q?94F5OpiRWVm2KICrQW34yKDZt8poDV1Hu3F8d0zF7P0aVnhF4jFI8HPGiqw6?=
 =?us-ascii?q?Fx5yDXBpXViAOXjauneakH3zLK7CGE12XK9E1CUUt8XLvIWVgbZ1DKtpL3/E?=
 =?us-ascii?q?7PQ7K1CqggKk1G08HGYq9LbMD5yFZLXvHuPPzAbG+r3WS9HxCFwvWLdoWuM1?=
 =?us-ascii?q?cd3TTADgA9kgkVtSKUNQkvGyG4i2nFSiFlDxTib166taFVqH69QV4phzqNaU?=
 =?us-ascii?q?Ipg7Gu/RgarfeHDe4YxPQJtDp3+BtuG1Po7tPEC8eH7zhhdaQUNcIv4F5GjT?=
 =?us-ascii?q?qCnxF2JNqtI7001Q1WSBh+o067j0Y/MY5Hi8V/6SpylAc=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FRAwCpu55dh0enVdFlDhABCxyGDIR?=
 =?us-ascii?q?NjluFFwGNaYo0AQgBAQEOLwEBhxgjOBMCAwkBAQUBAQEBAQUEAQECEAEBAQg?=
 =?us-ascii?q?NCQgphUCCOikBg1URfA8CJgIkEgEFASIBGhqDAIJ4pD2BAzyLJoEyhAsBAYR?=
 =?us-ascii?q?aAQkNgUgSeiiMDoIXgRGLIoJeBIE5AQEBlS+WVwEGAoIQFIxUiEUbgioBlxW?=
 =?us-ascii?q?OLZlPDyOBRoF7MxolfwZngU9PEBSBaY1xBAFWJJFLAQE?=
X-IPAS-Result: =?us-ascii?q?A2FRAwCpu55dh0enVdFlDhABCxyGDIRNjluFFwGNaYo0A?=
 =?us-ascii?q?QgBAQEOLwEBhxgjOBMCAwkBAQUBAQEBAQUEAQECEAEBAQgNCQgphUCCOikBg?=
 =?us-ascii?q?1URfA8CJgIkEgEFASIBGhqDAIJ4pD2BAzyLJoEyhAsBAYRaAQkNgUgSeiiMD?=
 =?us-ascii?q?oIXgRGLIoJeBIE5AQEBlS+WVwEGAoIQFIxUiEUbgioBlxWOLZlPDyOBRoF7M?=
 =?us-ascii?q?xolfwZngU9PEBSBaY1xBAFWJJFLAQE?=
X-IronPort-AV: E=Sophos;i="5.67,278,1566889200"; d="scan'208";a="13445632"
Received: from mail-lf1-f71.google.com ([209.85.167.71])
 by smtp1.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Oct 2019 22:10:02 -0700
Received: by mail-lf1-f71.google.com with SMTP id m16so1064739lfb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 22:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=GIIH2P83q/mX3xh3maQPqHlz4QJ+Z9HFyeC3gCwbPig=;
 b=d0sdtdm9t57Fa+LOEiZJb+oH51odgLLYB53IKV+0S5f7Gm+OBkjfw3klPloqaIirZl
 7eEzO/iQhUGquo4xnYZer8TvHj19NZRIBimbwhXFP3c68AaZPZs+gYfvcCVS/JiDfiYG
 UPOKSwK9SgpRrbpDuSpZUPGew/NA2AAVPiJLsS1IvGLbzKuTt9TkJ9V5syjV3NRGyRYH
 CNyzAoA/CQ2os2Li/JxRdva75zWpz03NG2lB2ScZv3q1xEjRMY8oKGfIyUQU7q7DELkM
 /u3m+NHZGnrC33lhFL02Z4pPyOatSWzm1XNIeRIpRV8SLjI6sBTs97EjKMwRdiS321C2
 cryA==
X-Gm-Message-State: APjAAAVeAP+GNIttFzn+MYmiw5XQ7pNt1K+/bIsicOhYSL6lND7+6ioi
 tgr4vI0Uyx1uLXCWYg6v8GX2R0FaHUWKCOvnV2NyUni7hK8hVFLqDSYzcTcRg13D9GskW96EbXX
 zL4z5udSL9qboV9AFZybShQ5taGQqeVKTeTmT5saPXHF2MQ==
X-Received: by 2002:a2e:6a04:: with SMTP id f4mr4795055ljc.97.1570684198370;
 Wed, 09 Oct 2019 22:09:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx4+Ag+0zjeb2o0SrDvuaa8jOaPuDPdyg3zpbOVtTOkjtWQ+gGvmWw+7mH9RDBzjC8jtfHcYs2qafTJb+Kg2A8=
X-Received: by 2002:a2e:6a04:: with SMTP id f4mr4795013ljc.97.1570684197726;
 Wed, 09 Oct 2019 22:09:57 -0700 (PDT)
MIME-Version: 1.0
From: Yizhuo Zhai <yzhai003@ucr.edu>
Date: Wed, 9 Oct 2019 22:09:32 -0700
Message-ID: <CABvMjLQuxeZnRMV0T5VDeEj7zV7mD4wzp5QPFCJ_oVhH0vRihQ@mail.gmail.com>
Subject: Potential NULL pointer deference in drm/amdgpu
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, Evan Quan <evan.quan@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Zhiyun Qian <zhiyunq@cs.ucr.edu>, 
 Chengyu Song <csong@cs.ucr.edu>
X-Mailman-Approved-At: Thu, 10 Oct 2019 06:55:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1570684204; x=1602220204;
 h=mime-version:from:date:message-id:subject:to;
 bh=pQsPO+s+a3PgY5D8E1xj+ga8C5+DTSwnG2XjsOjt7mI=;
 b=d881VhAgnIbWxLv+jM4h7aXdW/GKkjvALeRkp5zGuWinfe3kdPXQaPGh
 fQz7hfmyiIl+D0NJSpXzK2K+Nnv+bv+u3yqvjm0e0rD6TvpweZ6uAweXF
 AXB5DzN05nNBotd3wvvnhwhWLR1l4cSl+pktLrJZ0+XfBcZnBLt1EflQY
 jPyF/gMt6iUjSAeDreNs/CCeDgIR6dAlCigtovVEVFQjcmf6H0/Fxk7bX
 PoM9KDrLdnaCVDU4QUdYdrzp+8Cu/lHOWexnyFf1/vIJa+wEKeg0Z/up3
 38W0Uh/zlbEMKL3pw4C/FuG/AoWZlIqvK43SyJAj7Z2N132jD4fLLtuBq
 Q==;
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxsOgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmVuY2UuYzoKVGhlIGZ1
bmN0aW9uIHRvX2FtZGdwdV9mZW5jZSgpIGNvdWxkIHJldHVybiBOVUxMLCBidXQgY2FsbGVycwpp
biB0aGlzIGZpbGUgZG9lcyBub3QgY2hlY2sgdGhlIHJldHVybiB2YWx1ZSBidXQgZGlyZWN0bHkg
ZGVyZWZlcmVuY2UgaXQsCndoaWNoIHNlZW1zIHBvdGVudGlhbGx5IHVuc2FmZS4KU3VjaCBjYWxs
ZXJzIGluY2x1ZGUgYW1kZ3B1X2ZlbmNlX2dldF90aW1lbGluZV9uYW1lKCksCmFtZGdwdV9mZW5j
ZV9lbmFibGVfc2lnbmFsaW5nKCkgYW5kIGFtZGdwdV9mZW5jZV9mcmVlKCkuCgoKLS0gCktpbmQg
UmVnYXJkcywKCllpemh1byBaaGFpCgpDb21wdXRlciBTY2llbmNlLCBHcmFkdWF0ZSBTdHVkZW50
ClVuaXZlcnNpdHkgb2YgQ2FsaWZvcm5pYSwgUml2ZXJzaWRlCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
