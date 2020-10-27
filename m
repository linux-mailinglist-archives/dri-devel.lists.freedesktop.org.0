Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC32C29A395
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 05:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7633B6E10A;
	Tue, 27 Oct 2020 04:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3038F6E10A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 04:15:40 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20201027041538epoutp01595e51c7980c9b40498fb457c4b9a34c~BvkMz6wAb2004020040epoutp01v
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 04:15:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20201027041538epoutp01595e51c7980c9b40498fb457c4b9a34c~BvkMz6wAb2004020040epoutp01v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1603772138;
 bh=QmsAGZ914pVlhHj0JHteeAL0P0zGoJ524XNBMQDKb8Y=;
 h=From:To:Cc:Subject:Date:References:From;
 b=MUoZsjxhxWwzlGSTuqbrbHxZspX8fATWzvDdidscqKYhCifl4DBp1EeBtZ7WI15mb
 nwK+xAQIOH7wfahUTnxXc2D7qKLjwTKYEDynVM/fHddXeMQOGemQEKdvY2HccoKu3U
 6EM0b7PMGqtCnq4ijY3RCQ90mcWdLRIU5+jv5tw4=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20201027041537epcas1p30f7ea22517894f410c44df158889104d~BvkMZDT7r2989729897epcas1p3M;
 Tue, 27 Oct 2020 04:15:37 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.156]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4CKyzq3K73zMqYkl; Tue, 27 Oct
 2020 04:15:35 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 49.FE.09918.7EE979F5; Tue, 27 Oct 2020 13:15:35 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20201027041534epcas1p22f6b232a4d6be92dcc807f28baedab44~BvkJwmHd61218612186epcas1p2r;
 Tue, 27 Oct 2020 04:15:34 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201027041534epsmtrp19af9fc5465560dd1a1a189dd624fbd57~BvkJvs7WX0073800738epsmtrp1X;
 Tue, 27 Oct 2020 04:15:34 +0000 (GMT)
X-AuditID: b6c32a36-713ff700000026be-34-5f979ee7ca32
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 EC.69.08745.6EE979F5; Tue, 27 Oct 2020 13:15:34 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.111.64]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201027041534epsmtip143f2b95ee50675314e32c1f7f2d92141~BvkJeuwhv2895528955epsmtip1f;
 Tue, 27 Oct 2020 04:15:34 +0000 (GMT)
From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
To: maxime@cerno.tech, eric@anholt.net, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org
Subject: [PATCH 0/1] drm/vc4: drv: Add error handding for bind
Date: Tue, 27 Oct 2020 13:14:41 +0900
Message-Id: <20201027041442.30352-1-hoegeun.kwon@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAJsWRmVeSWpSXmKPExsWy7bCmge7zedPjDRbeE7boPXeSyWJt71EW
 i//bJjJbvJ27mMVi/pFzrBZXvr5nszjQeJnR4v3yLjaLTY+vsVpc3jWHzWLi7Q3sFjN+/GO0
 aN17hN1ix7yDjA58Hk3vj7F5zLp/ls3jzrnzbB57vy1g8di0qpPNY/u3B6we97uPM3lsXlLv
 0Xr0F4tH35ZVjB6fN8kFcEdl22SkJqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl
 5qbaKrn4BOi6ZeYAvaGkUJaYUwoUCkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKbAs0CtOzC0u
 zUvXS87PtTI0MDAyBSpMyM74P/UeW8EmnoobN9+wNjAu5epi5OSQEDCRmPLtETuILSSwg1Fi
 4muBLkYuIPsTo8TyFzeZIJzPjBLH97xjh+noeHKcDSKxi1FixpH37HBVTw/MYAGpYhPQlfja
 c50JxBYRiJe41tvGClLELLCKSeLcjiVgRcICdhKdbw4A2RwcLAKqEu+fu4CEeQVsJTafXssG
 sU1eYvWGA8wgvRICUzkknk34wAyRcJF42X8WqkhY4tXxLVDnSQHF26DsYokrM1+xQDQ3MEr0
 T5wNlTCW2L90MhPIYmYBTYn1u/QhwooSO3/PZQSxmQX4JN597WEFKZEQ4JXoaBOCKFGTeNZw
 gBXClpE41bucCcL2kFgy/RYrJBxjJW7cn8k6gVF2FsKCBYyMqxjFUguKc9NTiw0LjJBjaRMj
 OGlqme1gnPT2g94hRiYOxkOMEhzMSiK8c2SmxgvxpiRWVqUW5ccXleakFh9iNAWG10RmKdHk
 fGDaziuJNzQ1MjY2tjAxNDM1NFQS5/2j3REvJJCeWJKanZpakFoE08fEwSnVwOT9qM/ibln/
 y7uXltu5TZ3SyRXjLvLehkVI+cvaHFe5y53zps1Wu+W/mud51147papelXXzzB7ZfVs7Kza7
 rO/1j7qnlbpP/d4x2z34vemZyqWb23nnRVv32E3eK7qwdeFbWRlOr8svnP6JmnNLb7B+yZIQ
 Njlrxu7fjVPTpAxFpTYFLU/eLqnJG3tGZuuaU5f3WNjJdO1v1rPv0b077dQ6xU9VTUFby+2d
 dH6qekVd4/+pnfPRx0vIZmHNZzuTc34M/2MKHJYzRa/aMPFlzi4JadZ3E6cekDqdt/ixmHSW
 VI7nfMGFJU+yc7mreialyEx+y127L3FPS+CU+IkKL8JD2NmmJT0TYer0UQwOU2Ipzkg01GIu
 Kk4EAAH6wbQjBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHLMWRmVeSWpSXmKPExsWy7bCSnO6zedPjDU4/1rXoPXeSyWJt71EW
 i//bJjJbvJ27mMVi/pFzrBZXvr5nszjQeJnR4v3yLjaLTY+vsVpc3jWHzWLi7Q3sFjN+/GO0
 aN17hN1ix7yDjA58Hk3vj7F5zLp/ls3jzrnzbB57vy1g8di0qpPNY/u3B6we97uPM3lsXlLv
 0Xr0F4tH35ZVjB6fN8kFcEdx2aSk5mSWpRbp2yVwZfyfeo+tYBNPxY2bb1gbGJdydTFyckgI
 mEh0PDnO1sXIxSEksINRYs2sfUwQCRmJVf1bWLsYOYBsYYnDh4shaj4ySjycsIcZpIZNQFfi
 a891sHoRgVSJtvdHWECKmAU2MUn0nexhBEkIC9hJdL45wAIyiEVAVeL9cxeQMK+ArcTm02vZ
 IHbJS6zecIB5AiPPAkaGVYySqQXFuem5xYYFRnmp5XrFibnFpXnpesn5uZsYwUGspbWDcc+q
 D3qHGJk4GA8xSnAwK4nwzpGZGi/Em5JYWZValB9fVJqTWnyIUZqDRUmc9+ushXFCAumJJanZ
 qakFqUUwWSYOTqkGpoiuhujHNQGfM49liP9dxeDgzzmZV3rDXbM53Mqr9j6KnRtc/l7sOcOt
 vbmr/zs8Slhq/nHd92lTFq9ev1XSuaQq8kf4tmdFK/8bHxG1P7p9y9Oa2YsNtih2nW/L2j1v
 pVh16vSGA5f+Wzl/yZdffvuht0nR9+XNc71Weh5waPnrMfea7Up2Rpkwrz/tPmUP5Y6tOa3y
 dwHHuoX7rtert/QrFW8XEVtzs2TxPu3HT2ex6MjPe+Ps2Fp7o6ed5bMq871PZmqOT/da6937
 wjFrSwkrz4S/W8+uu84QdvPa0rmtm1OFpuz3EPjCUXrhUYDFX/FF0294rOp88/SWrnXFY7Uu
 o0fz5gm7HBZ+sC9TiGuuEktxRqKhFnNRcSIAkUSQbtECAAA=
X-CMS-MailID: 20201027041534epcas1p22f6b232a4d6be92dcc807f28baedab44
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201027041534epcas1p22f6b232a4d6be92dcc807f28baedab44
References: <CGME20201027041534epcas1p22f6b232a4d6be92dcc807f28baedab44@epcas1p2.samsung.com>
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
Cc: devicetree@vger.kernel.org, sungguk.na@samsung.com,
 dave.stevenson@raspberrypi.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, hoegeun.kwon@samsung.com,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello all,

There is a problem that if vc4_drm bind fails, a memory leak occurs on
the drm_property_create side as shown below. Add error handding for
drm_mode_config.

unreferenced object 0xffffff80f5a7a6c8 (size 576):
  comm "swapper/0", pid 1, jiffies 4294892559 (age 181.448s)
  hex dump (first 32 bytes):
    00 00 1e 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    f8 f1 0e f5 80 ff ff ff e0 a6 a7 f5 80 ff ff ff  ................
  backtrace:
    [<00000000fd3656dc>] kmem_cache_alloc+0x1a4/0x328
    [<000000009dfa1aab>] radix_tree_node_alloc.constprop.19+0x50/0x108
    [<00000000a9f1657b>] idr_get_free+0x21c/0x2b8
    [<0000000099f2eea6>] idr_alloc_u32+0x68/0xf0
    [<00000000525beb52>] idr_alloc+0x44/0x80
    [<00000000dbfbaa4b>] __drm_mode_object_add+0x64/0xc0
    [<000000002c24dfc8>] drm_mode_object_add+0x3c/0x50
    [<00000000f45b491f>] drm_property_create+0xf0/0x1a0
    [<000000002e1a296b>] drm_connector_create_standard_properties+0x30/0x130
    [<000000007c53e4bd>] drm_mode_config_init+0x138/0x498
    [<00000000cc1b0767>] vc4_drm_bind+0x168/0x1f8
    [<0000000041d69f98>] try_to_bring_up_master+0x180/0x1e8
    [<00000000d1e1caae>] component_master_add_with_match+0xbc/0x108
    [<0000000085cea46d>] vc4_platform_drm_probe+0xd8/0x108
    [<00000000eacabf20>] platform_drv_probe+0x58/0xa8
    [<000000003822d094>] really_probe+0x10c/0x350

Best regards,
Hoegeun

Hoegeun Kwon (1):
  drm/vc4: drv: Add error handding for bind

 drivers/gpu/drm/vc4/vc4_drv.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
