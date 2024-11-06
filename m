Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70289BEC61
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 14:04:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C73210E281;
	Wed,  6 Nov 2024 13:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iF+f2JrO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57EE10E281
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 13:04:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B6BA475;
 Wed,  6 Nov 2024 14:04:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1730898275;
 bh=682rZ4W8M3E5mVOEB3/2mrEAAw15OgHnlpXKz526rA0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iF+f2JrOf8LKiTjHV1UChMRbmf6ckq9rA1BPUFp1xg1DRGXF+rkuI5950BTGfwpL+
 Yu4AWc7mmgpAU2nekPMMSN1CPfv8fof6p/lUxd1J/aU5O1aWQByo6hUgRFK9fVFltt
 vI+mieU5JY7lKw6pBcmWAlmuai8Wap7Qb23EoTFI=
Date: Wed, 6 Nov 2024 15:04:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shu-hsiang Yang =?utf-8?B?KOaliuiIkue/lCk=?= <Shu-hsiang.Yang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "yunkec@chromium.org" <yunkec@chromium.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Yaya Chang =?utf-8?B?KOW8tembhea4hSk=?= <Yaya.Chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Teddy Chen =?utf-8?B?KOmZs+S5vuWFgyk=?= <Teddy.Chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "hidenorik@chromium.org" <hidenorik@chromium.org>,
 Shun-Yi Wang =?utf-8?B?KOeOi+mghuWEhCk=?= <Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 10/10] uapi: linux: add mediatek isp_7x camsys user api
Message-ID: <20241106130437.GA16791@pendragon.ideasonboard.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-11-Shu-hsiang.Yang@mediatek.com>
 <ff96b314cdd3d52a14a5e91f79ec3097d04c4380.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff96b314cdd3d52a14a5e91f79ec3097d04c4380.camel@mediatek.com>
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

On Mon, Oct 14, 2024 at 05:56:40AM +0000, CK Hu (胡俊光) wrote:
> Hi, Shu-hsiang:
> 
> On Wed, 2024-10-09 at 19:15 +0800, Shu-hsiang Yang wrote:
> > Add UAPI for MediaTek ISP platform, providing user-space
> > interfaces for the new camsys driver.
> > 
> > Signed-off-by: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
> > ---
> 
> [snip]
> 
> > +
> > +/* MTK ISP camsys controls */
> > +#define V4L2_CID_MTK_CAM_USED_ENGINE_LIMIT	(V4L2_CID_USER_MTK_CAM_BASE + 1)
> > +#define V4L2_CID_MTK_CAM_BIN_LIMIT		(V4L2_CID_USER_MTK_CAM_BASE + 2)
> > +#define V4L2_CID_MTK_CAM_FRZ_LIMIT		(V4L2_CID_USER_MTK_CAM_BASE + 3)
> > +#define V4L2_CID_MTK_CAM_RESOURCE_PLAN_POLICY	(V4L2_CID_USER_MTK_CAM_BASE + 4)
> > +#define V4L2_CID_MTK_CAM_USED_ENGINE		(V4L2_CID_USER_MTK_CAM_BASE + 5)
> > +#define V4L2_CID_MTK_CAM_BIN			(V4L2_CID_USER_MTK_CAM_BASE + 6)
> > +#define V4L2_CID_MTK_CAM_FRZ			(V4L2_CID_USER_MTK_CAM_BASE + 7)
> > +#define V4L2_CID_MTK_CAM_USED_ENGINE_TRY	(V4L2_CID_USER_MTK_CAM_BASE + 8)
> > +#define V4L2_CID_MTK_CAM_BIN_TRY		(V4L2_CID_USER_MTK_CAM_BASE + 9)
> > +#define V4L2_CID_MTK_CAM_FRZ_TRY		(V4L2_CID_USER_MTK_CAM_BASE + 10)
> > +#define V4L2_CID_MTK_CAM_PIXEL_RATE		(V4L2_CID_USER_MTK_CAM_BASE + 11)
> > +#define V4L2_CID_MTK_CAM_FEATURE		(V4L2_CID_USER_MTK_CAM_BASE + 12)
> > +#define V4L2_CID_MTK_CAM_SYNC_ID		(V4L2_CID_USER_MTK_CAM_BASE + 13)
> > +#define V4L2_CID_MTK_CAM_RAW_PATH_SELECT	(V4L2_CID_USER_MTK_CAM_BASE + 14)
> > +#define V4L2_CID_MTK_CAM_HSF_EN			(V4L2_CID_USER_MTK_CAM_BASE + 15)
> > +#define V4L2_CID_MTK_CAM_PDE_INFO		(V4L2_CID_USER_MTK_CAM_BASE + 16)
> > +#define V4L2_CID_MTK_CAM_MSTREAM_EXPOSURE	(V4L2_CID_USER_MTK_CAM_BASE + 17)
> > +#define V4L2_CID_MTK_CAM_RAW_RESOURCE_CALC	(V4L2_CID_USER_MTK_CAM_BASE + 18)
> > +#define V4L2_CID_MTK_CAM_TG_FLASH_CFG		(V4L2_CID_USER_MTK_CAM_BASE + 19)
> > +#define V4L2_CID_MTK_CAM_RAW_RESOURCE_UPDATE	(V4L2_CID_USER_MTK_CAM_BASE + 20)
> > +#define V4L2_CID_MTK_CAM_CAMSYS_HW_MODE		(V4L2_CID_USER_MTK_CAM_BASE + 21)
> > +
> 
> Please give introduction of how to use these user space interface.

I'm very, very *not* thrilled by all this. It looks like a big pile of
hacks really. Every single parameter used by those controls needs to be
clearly documented, including explaining how they are used, in order for
us to review the API. I suspect that many of the parameters should
instead be handled through the ISP parameters buffers, or be controlled
from standard V4L2 APIs.

-- 
Regards,

Laurent Pinchart
