Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF23A140741
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 11:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81416F4CC;
	Fri, 17 Jan 2020 10:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF496F4CC
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 10:03:07 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200117100305euoutp025c1da054dd012256cfa417f86dbc8b94~qpGfe9xM21664816648euoutp02M
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 10:03:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200117100305euoutp025c1da054dd012256cfa417f86dbc8b94~qpGfe9xM21664816648euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579255385;
 bh=FCkijMQphRE8Mr4fW6ndAfrNvL8gGE95bsivtOZKJ30=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=j5QfMYv076MRYuAvV9unKr0uS4ufwRSCIsTjKsnBVV0dRcBKcMesk+Dstxdv/FYDa
 fUH/+q3TdmhbvM8Da8d38z5E7Mz2wm2c41wcdIot37xLH4OWnZIAwcOmDgp36dzuJ7
 Xssy0jqfjlN3wMZdJ9QgybqwgWmnkQwoG6O1UKFI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200117100305eucas1p2ff5eb893a046122f6bc743ce871fa547~qpGfQ8rTh0451504515eucas1p2a;
 Fri, 17 Jan 2020 10:03:05 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 64.2A.61286.956812E5; Fri, 17
 Jan 2020 10:03:05 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200117100304eucas1p1758fb3bcddb6440d914684f863fa550d~qpGex6Blh1996119961eucas1p1g;
 Fri, 17 Jan 2020 10:03:04 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200117100304eusmtrp1803be891b65d0223e1f0acfaebbe872b~qpGexFAua3085130851eusmtrp1F;
 Fri, 17 Jan 2020 10:03:04 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-3c-5e218659b042
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 56.A5.08375.856812E5; Fri, 17
 Jan 2020 10:03:04 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200117100304eusmtip277a70c91926c89454bd5ab1160a717c4~qpGeQ7X-51169211692eusmtip2S;
 Fri, 17 Jan 2020 10:03:04 +0000 (GMT)
Subject: Re: [PATCH 1/1] drm/bridge: anx78xx: fix integer type used for
 storing dp link rate
To: Tobias Schramm <t.schramm@manjaro.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@siol.net>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <4486560b-05e5-6c03-0a8e-4f193141a5c8@samsung.com>
Date: Fri, 17 Jan 2020 11:03:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200109084801.3117-2-t.schramm@manjaro.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFKsWRmVeSWpSXmKPExsWy7djPc7qRbYpxBoc62C16z51ksvi/bSKz
 xZWv79ksrn5/yWxx8s1VFovOiUvYLS7vmsNmcagv2uLeur3MDpwe72+0snvs/baAxWN2x0xW
 jxMTLjF5bP/2gNXjfvdxJo+Gw2sYPQ70Tmbx+LxJLoAzissmJTUnsyy1SN8ugStj/+TlTAVb
 eSue7nnP2MA4jbuLkZNDQsBE4s3jaexdjFwcQgIrGCX+d91hg3C+MEpsffiQEcL5zChx+d5X
 FpiW12f2Q1UtZ5RY3bCLGcJ5yyhx/3c3M0iVsECcxMOFu1hAEiICtxklVm4+CDaLWaCVUeLZ
 2clgVWwCmhJ/N99kA7F5Bewklq45CRZnEVCVWNbVwQ5iiwpESDy58pgVokZQ4uTMJ2B3cApY
 STSsfArWyywgL7H97RxmCFtc4taT+UwgyyQE7rFLzDu5nhXicBeJNSeXQNnCEq+Ob2GHsGUk
 Tk/ugXquXuL+ihZmiOYOYBBs2MkMkbCWuHPuF9A2DqANmhLrd+lDhB0lGs9+YAYJSwjwSdx4
 KwhxA5/EpG3TocK8Eh1tQhDVihL3z26FGigusfTCV7YJjEqzkHw2C8k3s5B8Mwth7wJGllWM
 4qmlxbnpqcWGeanlesWJucWleel6yfm5mxiBKez0v+OfdjB+vZR0iFGAg1GJh3dGkEKcEGti
 WXFl7iFGCQ5mJRHekzNk44R4UxIrq1KL8uOLSnNSiw8xSnOwKInzGi96GSskkJ5YkpqdmlqQ
 WgSTZeLglGpg3FZV9mKXo1zCC8t73wT//PQwC7maITCx6f4l9777RXc+ylyd0VhvfrNgYsbW
 qEdp7u6npn6OKq6PX8VeFTjjrRK/bVL82wU/brT+WsBg4vhTVuSCGuNCnbllIjedHQ09y++d
 UjbR7u/UFH9wKe35oWYFr4w5u/wkLp1+u8LGI63hnWDOkbxbSizFGYmGWsxFxYkAQX8Y7V0D
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRmVeSWpSXmKPExsVy+t/xe7oRbYpxBkcXKlj0njvJZPF/20Rm
 iytf37NZXP3+ktni5JurLBadE5ewW1zeNYfN4lBftMW9dXuZHTg93t9oZffY+20Bi8fsjpms
 HicmXGLy2P7tAavH/e7jTB4Nh9cwehzonczi8XmTXABnlJ5NUX5pSapCRn5xia1StKGFkZ6h
 pYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7G/snLmQq28lY83fOesYFxGncXIyeHhICJ
 xOsz+9m6GLk4hASWMko0P37GBJEQl9g9/y0zhC0s8edaF1TRa0aJgwv2sIEkhAXiJB4u3MUC
 khARuM0ocfrKVGYQh1mglVFiZ8dFRoiWvYwSe+b1gs1iE9CU+Lv5Jlg7r4CdxNI1J8HiLAKq
 Esu6OthBbFGBCIm3v2+yQtQISpyc+YQFxOYUsJJoWPkUrJdZQF3iz7xLzBC2vMT2t3OgbHGJ
 W0/mM01gFJqFpH0WkpZZSFpmIWlZwMiyilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzBqtx37
 uXkH46WNwYcYBTgYlXh4ZwQpxAmxJpYVV+YeYpTgYFYS4T05QzZOiDclsbIqtSg/vqg0J7X4
 EKMp0HMTmaVEk/OBCSWvJN7Q1NDcwtLQ3Njc2MxCSZy3Q+BgjJBAemJJanZqakFqEUwfEwen
 VAOjjnGwdJiS4yV+U6VT+2VPLbIRbY7Ly1F/N5Pn7JOFJ+v//n+myuqt1paxVMzH3G3PuaKN
 tUHvpA4sdVvhLbozJF7Wx3aC4gMhwbP7s4q/H5ihVnjmwu3L5oHqc4w6NE8/mbe6/vGeT9IG
 5UfKX5iq9P9l2SYhVr5l3W1phnU615oWCv3ZLXZaiaU4I9FQi7moOBEAXZU0H/ACAAA=
X-CMS-MailID: 20200117100304eucas1p1758fb3bcddb6440d914684f863fa550d
X-Msg-Generator: CA
X-RootMTR: 20200109084920eucas1p1ed027ed22778b67eb86301d3bdf34bb5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200109084920eucas1p1ed027ed22778b67eb86301d3bdf34bb5
References: <20200109084801.3117-1-t.schramm@manjaro.org>
 <CGME20200109084920eucas1p1ed027ed22778b67eb86301d3bdf34bb5@eucas1p1.samsung.com>
 <20200109084801.3117-2-t.schramm@manjaro.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09.01.2020 09:48, Tobias Schramm wrote:
> commit ff1e8fb68ea0 ("drm/bridge: analogix-anx78xx: Avoid drm_dp_link helpers")
> changed the link training logic to remove use of drm_dp_link helpers. However
> the new logic stores the maximum link rate in a u8, overflowing it.
> This commit changes the logic to store the max link rate in a unsigned int
> instead.
>
> Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
> ---
>  drivers/gpu/drm/bridge/analogix-anx78xx.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix-anx78xx.c
> index 274989f96a91..0f38b8c40dff 100644
> --- a/drivers/gpu/drm/bridge/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix-anx78xx.c
> @@ -748,6 +748,7 @@ static int anx78xx_init_pdata(struct anx78xx *anx78xx)
>  static int anx78xx_dp_link_training(struct anx78xx *anx78xx)
>  {
>  	u8 dp_bw, dpcd[2];
> +	unsigned int max_link_rate;
>  	int err;
>  
>  	err = regmap_write(anx78xx->map[I2C_IDX_RX_P0], SP_HDMI_MUTE_CTRL_REG,
> @@ -866,8 +867,8 @@ static int anx78xx_dp_link_training(struct anx78xx *anx78xx)
>  	if (err)
>  		return err;
>  
> -	dpcd[0] = drm_dp_max_link_rate(anx78xx->dpcd);
> -	dpcd[0] = drm_dp_link_rate_to_bw_code(dpcd[0]);
> +	max_link_rate = drm_dp_max_link_rate(anx78xx->dpcd);
> +	dpcd[0] = drm_dp_link_rate_to_bw_code(max_link_rate);


The code converts bw_code to rate, then reverse, maybe it should be
simplified:

dpcd[0] = anx78xx->dpcd[DP_MAX_LINK_RATE];


Regards

Andrzej


>  	err = regmap_write(anx78xx->map[I2C_IDX_TX_P0],
>  			   SP_DP_MAIN_LINK_BW_SET_REG, dpcd[0]);
>  	if (err)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
