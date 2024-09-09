Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3A7970AD0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 02:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0124310E21C;
	Mon,  9 Sep 2024 00:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="GOHj1aG4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED67D10E21C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 00:33:28 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20240909003326epoutp047aaa0377c919df38b22502669f3eacc7~zbCk7BJML2347223472epoutp04K
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 00:33:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20240909003326epoutp047aaa0377c919df38b22502669f3eacc7~zbCk7BJML2347223472epoutp04K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1725842006;
 bh=1G+ASTI4bMzmwPy0O5lazP8/CD+An6upXbu/zYW46Rc=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=GOHj1aG4UmnJwaGzvVVtIUliZcmlZ4AdkBGgdjbOWWvrmF/KfRumfXXLeUT/iwlHK
 rKZ4gPW67rReH2NZiC+iY1CmIqZRK13/9IiA6jktzBg9T/4nAq63uGsRflPRqq0c3q
 yS5LhIezxISAhZx+U7vW1gDEsdqdXKPkizoTWUc0=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20240909003326epcas1p350e5fd5906e45056a43c1aade062ecd1~zbCkqJ8Mr0118901189epcas1p3n;
 Mon,  9 Sep 2024 00:33:26 +0000 (GMT)
Received: from epsmgec1p1-new.samsung.com (unknown [182.195.38.232]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4X279J6cXnz4x9Pq; Mon,  9 Sep
 2024 00:33:24 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmgec1p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 87.FE.19509.4524ED66; Mon,  9 Sep 2024 09:33:24 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20240909003324epcas1p1ca105cce3f7ba7f60724e0272c169fb9~zbCi4HLdq0834108341epcas1p1i;
 Mon,  9 Sep 2024 00:33:24 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240909003324epsmtrp28853f99e55b593fcf893c85c56dd07e7~zbCi3gsF30427904279epsmtrp2z;
 Mon,  9 Sep 2024 00:33:24 +0000 (GMT)
X-AuditID: b6c32a4c-17bc070000004c35-a0-66de4254604a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 64.97.19367.4524ED66; Mon,  9 Sep 2024 09:33:24 +0900 (KST)
Received: from inkidae001 (unknown [10.113.221.213]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20240909003324epsmtip1bb587d6b5395fa477c6043a1eae0ea71~zbCipoIhV0362103621epsmtip1Z;
 Mon,  9 Sep 2024 00:33:24 +0000 (GMT)
From: =?ks_c_5601-1987?B?tOvAzrHiL1RpemVuIFBsYXRmb3JtIExhYihTUikvu++8usD8wNo=?=
 <inki.dae@samsung.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>
Cc: <dri-devel@lists.freedesktop.org>, <linux-samsung-soc@vger.kernel.org>
In-Reply-To: <20240906091331.34244-1-inki.dae@samsung.com>
Subject: RE: [GIT PULL] exynos-drm-next
Date: Mon, 9 Sep 2024 09:33:23 +0900
Message-ID: <13aa01db024f$e0ff20d0$a2fd6270$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKnWCNG2FAPxsLYb1AQ/rvYmFL7hgGws9RMsKho9SA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkk+LIzCtJLcpLzFFi42LZdljTQDfE6V6aweQ/Oha9504yWfzfNpHZ
 4srX92wWM87vY3Jg8dj7bQGLx/ZvD1g97ncfZ/L4vEkugCUq2yYjNTEltUghNS85PyUzL91W
 yTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMHaKWSQlliTilQKCCxuFhJ386mKL+0JFUh
 I7+4xFYptSAlp8C0QK84Mbe4NC9dLy+1xMrQwMDIFKgwITvj/7Fl7AXrJSu2LznK2MD4SLiL
 kZNDQsBE4tWnN2xdjFwcQgJ7GCWW/f8E5XxilLi9tpsRpArM2fnREKZjaeNXqKKdjBL/nt9i
 hnBeMkocaXjKBlLFJpAhcbd9MSuILSKgKdH1oIsJxGYW8JKYueMoC4jNKWAlMWHXT7ANwgLq
 Eid2rAerZxFQkVh2EKKXV8BS4uT3b+wQtqDEyZlPWCDmGEksWT0faqa8xPa3c5ghrlOQ+Pl0
 GdReK4nGWWdZIWpEJGZ3tkHVfGSXeHOMDcJ2kfhx6S5UXFji1fEt7BC2lMTnd3vBvpQQmMwo
 cef6ChYIZwajxOGf1xkhqowl9i+dDHUFn8S7rz1A2ziA4rwSHW1CECVKEscu3oAql5C4sGQi
 G0SJh8TdfYETGBVnIXltFpLXZiF5bRaSFxYwsqxilEotKM5NT002LDDUzUsth0d5cn7uJkZw
 mtTy2cH4ff1fvUOMTByMhxglOJiVRHj77e6lCfGmJFZWpRblxxeV5qQWH2I0BYb4RGYp0eR8
 YKLOK4k3NLE0MDEzMjaxMDQzVBLnPXOlLFVIID2xJDU7NbUgtQimj4mDU6qBiSkh2mqa48O/
 v1Ivi/JsdCuep3vgx1rXpQ2hOjMrr2daOtmfSrlkmOB0QEX2kE/Dh71/1dfr/fDtvs78Plxi
 yzP5MP6qa7euh8md73BN3PjxnOhR3xCjlkg2F9Yfh8OdH8+wWvPlvsGS82opnZ8sZ5iXHjJ+
 ELBLU2KpUJTNfJsdZw8snJ2hVlZw0UVM5v+TnAJ1xes7TznOb7mUUV7TxbrD4fb/w7yz5I2v
 9uVNsYs5dEhUr4uTj+VsvdOSRYsyTzlkCrVe2MU634QlimvLmUK+r4kx5vfSFEw27asrldqv
 s+T7erMKZ8f3MdU3Gs2Urc8c3dv25u3ET4eaBQ83L97TtkDR5Z3IP9UL++f8VmIpzkg01GIu
 Kk4EAA2fMp4cBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJLMWRmVeSWpSXmKPExsWy7bCSnG6I0700g1/LeS16z51ksvi/bSKz
 xZWv79ksZpzfx+TA4rH32wIWj+3fHrB63O8+zuTxeZNcAEsUl01Kak5mWWqRvl0CV8b/Y8vY
 C9ZLVmxfcpSxgfGRcBcjJ4eEgInE0savbF2MXBxCAtsZJW5unc/axcgBlJCQ2LKVA8IUljh8
 uBikXEjgOaPEqZX1IDabQJrEpLn7WUFsEQFtiRNrpoDZzAI+Et923WaEGNnNKLF28y0mkASn
 gJXEhF0/GUFsYQF1iRM71oM1sAioSCw7uBjM5hWwlDj5/Rs7hC0ocXLmExaIoSYSjYe7oWx5
 ie1v5zBD3K8g8fPpMqgjrCQaZ52FOkJEYnZnG/MERuFZSEbNQjJqFpJRs5C0LGBkWcUomlpQ
 nJuem1xgqFecmFtcmpeul5yfu4kRHBtaQTsYl63/q3eIkYmD8RCjBAezkghvv929NCHelMTK
 qtSi/Pii0pzU4kOM0hwsSuK8yjmdKUIC6YklqdmpqQWpRTBZJg5OqQYmzWZnqbPB69RWcU/g
 4ts3qdzicnWF35vwPn/XXZ3ceqmSx3wSOiYxr/q182z5TDstuy8xAebaR+T2+TWsZH7md6Gw
 uObPtISzP2I2Ntm+LhVbZ5lkZxhySU8h/avthaWzul/zaaiteX3wp0xaaOp0wzf8Xswiq03n
 WIl2CkTdnKB/7OeXC0XpYr9X+uuVqB5i0S96qnxJYvqUrEltxSwvxC0tfn1j0whaJx79b06Z
 4ofXfT1KomZ1yw9nZ09cHHJJv8niQV+hnO9GLrNDGw62uhwONz4780cd853LxVNmrZO+bsOp
 M0m5zfXqH9ZPbmf6eqSZXi3esnBKfIbmsXz/nAsTGcJTw6PnzbGa/laJpTgj0VCLuag4EQCn
 dqjH/AIAAA==
X-CMS-MailID: 20240909003324epcas1p1ca105cce3f7ba7f60724e0272c169fb9
X-Msg-Generator: CA
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240906091343epcas1p4e83ab2ca25edbed8e129f2c6a9f7292d
References: <CGME20240906091343epcas1p4e83ab2ca25edbed8e129f2c6a9f7292d@epcas1p4.samsung.com>
 <20240906091331.34244-1-inki.dae@samsung.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

There was my mistake. One patch not related to Exynos was included to this
PR.
I will resend it again.

Thanks,
Inki Dae

> -----Original Message-----
> From: Inki Dae <daeinki@gmail.com> On Behalf Of Inki Dae
> Sent: Friday, September 6, 2024 6:14 PM
> To: airlied@linux.ie; daniel@ffwll.ch
> Cc: dri-devel@lists.freedesktop.org; linux-samsung-soc@vger.kernel.org
> Subject: [GIT PULL] exynos-drm-next
> 
> Hi Dave and Daniel,
> 
>    Just three cleanups and one fixup.
> 
> Please kindly let me know if there is any problem.
> 
> Thanks,
> 
> 
> The following changes since commit
> b1aa0491fad27f030c94ed42c873c3f46f5e7364:
> 
>   drm/xe: Fix merge fails related to display runtime PM (2024-09-02
> 14:14:07 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos
> tags/exynos-drm-next-for-v6.12
> 
> for you to fetch changes up to 94ebc3d3235c5c516f67315059ce657e5090e94b:
> 
>   drivers:drm:exynos_drm_gsc:Fix wrong assignment in gsc_bind() (2024-09-
> 06 16:08:30 +0900)
> 
> ----------------------------------------------------------------
> Three cleanups
> - Drop stale exynos file pattern from MAINTAINERS file
>   The old "exynos" directory is removed from MAINTAINERS as Samsung Exynos
>   display bindings have been relocated. This resolves a warning
>   from get_maintainers.pl about no files matching the outdated directory.
> 
> - Constify struct exynos_drm_ipp_funcs
>   By making struct exynos_drm_ipp_funcs constant, the patch enhances
> security
>   by moving the structure to a read-only section of memory.
>   This change results in a slight reduction in the data section size.
> 
> - Remove unnecessary code
>   The function exynos_atomic_commit is removed as it became redundant
>   after a previous update. This cleans up the code and eliminates
>   unused function declarations.
> 
> One fixup
> - Fix wrong assignment in gsc_bind()
>   A double assignment in gsc_bind() was flagged by the cocci tool and
>   corrected to fix an incorrect assignment, addressing a potential issue
>   introduced in a prior commit.
> 
> ----------------------------------------------------------------
> Christophe JAILLET (1):
>       drm/exynos: Constify struct exynos_drm_ipp_funcs
> 
> Krzysztof Kozlowski (1):
>       dt-bindings: MAINTAINERS: drop stale exynos file pattern
> 
> Kwanghoon Son (1):
>       drm/exynos: Remove unnecessary code
> 
> Simona Vetter (1):
>       MAINATINERS: update drm maintainer contacts
> 
> Yuesong Li (1):
>       drivers:drm:exynos_drm_gsc:Fix wrong assignment in gsc_bind()
> 
>  .mailmap                                   |  4 ++++
>  Documentation/gpu/introduction.rst         | 10 ++++-----
>  Documentation/gpu/todo.rst                 | 34 +++++++++++++++----------
----
> -
>  MAINTAINERS                                |  7 +++---
>  drivers/gpu/drm/exynos/exynos_drm_drv.h    |  4 ----
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c   |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c    |  4 ++--
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c |  2 +-
>  8 files changed, 33 insertions(+), 34 deletions(-)


