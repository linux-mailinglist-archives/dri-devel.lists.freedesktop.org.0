Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC4F3F5EC6
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 15:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBC3898BE;
	Tue, 24 Aug 2021 13:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D126F898BE
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 13:14:16 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210824131415euoutp024d3526b60af5d7c7143801ccf4b54b42~eQFZpLzjV0708107081euoutp02Z
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 13:14:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210824131415euoutp024d3526b60af5d7c7143801ccf4b54b42~eQFZpLzjV0708107081euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1629810855;
 bh=eJJi9emv25BwjyYtMiWC9IE1bH0IcQTZJ7aAWTiH7R8=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=Xn/dJWLhu0FKnrzgLidYNdrGN4LRydjifa7tZJg2LeNCyI+GvVfh5QO5tYac50VtG
 IrPnce3ukzWBMq7w+5Qz7udxtuhl5GyINIIQvYOKQR8DS5c/5zHSmE14Mkzyk9a1wh
 V7qCWkeR/w/J5gdVxWWSgRn1MxeHmfuNTXeZOcc0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210824131414eucas1p255250a7676f4a4f60adce98d23819112~eQFZO2ghz3065230652eucas1p26;
 Tue, 24 Aug 2021 13:14:14 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 73.21.42068.6A0F4216; Tue, 24
 Aug 2021 14:14:14 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210824131413eucas1p1cf4b3d3d6168b1cbfa6f795eb561178b~eQFYjym_T3195731957eucas1p1g;
 Tue, 24 Aug 2021 13:14:13 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210824131413eusmtrp1ebfb5e2ad4a126c916261b288d4e4ca7~eQFYi4SLj0348703487eusmtrp1i;
 Tue, 24 Aug 2021 13:14:13 +0000 (GMT)
X-AuditID: cbfec7f4-c71ff7000002a454-1e-6124f0a64797
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 6F.41.31287.5A0F4216; Tue, 24
 Aug 2021 14:14:13 +0100 (BST)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210824131413eusmtip14825bc4e85990e869875e9aad1c9f84e~eQFX2CRYm0829008290eusmtip1Q;
 Tue, 24 Aug 2021 13:14:13 +0000 (GMT)
Message-ID: <b8dfa3de-9f84-27be-fce3-e63d68f99ccc@samsung.com>
Date: Tue, 24 Aug 2021 15:14:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0)
 Gecko/20100101 Thunderbird/92.0
Subject: Re: [PATCH v3 6/8] drm/bridge: ps8640: Register and attach our DSI
 device at probe
Content-Language: en-GB
To: Maxime Ripard <maxime@cerno.tech>, Jonas Karlman <jonas@kwiboo.se>, Sam
 Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Neil Armstrong <narmstrong@baylibre.com>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Robert Foss
 <robert.foss@linaro.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <20210823084723.1493908-7-maxime@cerno.tech>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGKsWRmVeSWpSXmKPExsWy7djPc7rLPqgkGizYLG/Re+4kk8XyM+uY
 La58fc9m8Xz+OkaLk2+uslh0TlzCbnF51xw2i4Uft7JYzPjxj9HiUF+0xadZD5ktVvzcymjx
 c9c8FostbyayOvB5vL/Ryu5x59x5No+ds+6ye8zumMnqsXjPSyaPExMuMXncubaHzWP7twes
 HvNOBnrc7z7O5LFk2lU2j82nqz0+b5IL4I3isklJzcksSy3St0vgyjj75ip7wT2FimfNt9kb
 GG9LdjFyckgImEgc3zSHqYuRi0NIYAWjRHPnFGYI5wujxPG1XSwQzmdGiW1zDrDCtCxZf5AV
 IrGcUWLXnA3sEM57Rol920GGcXLwCthJ3Dl3FcxmEVCVeH/oMTNEXFDi5MwnLCC2qECCxPOl
 X8FqhAViJRo+nQeLMwuISzR9WQm2QUTgN7PElubzbBAJR4mbU4+BncEmoCnxd/NNoDgHB6eA
 pcThheEQJfISzVtng/0gIXCYU6Jpwgc2iLNdJBpW9TJC2MISr45vYYewZSROT+5hgbDrJe6v
 aIFq7mCU2LphJzNEwhrom19gy5iBFq/fpQ8RdpTof3KTHSQsIcAnceOtIMQNfBKTtk1nhgjz
 SnS0CUFUK0rcP7sVaqC4xNILX9kmMCrNQgqVWUi+n4Xkm1kIexcwsqxiFE8tLc5NTy02ykst
 1ytOzC0uzUvXS87P3cQITIqn/x3/soNx+auPeocYmTgYDzFKcDArifD+ZVJOFOJNSaysSi3K
 jy8qzUktPsQozcGiJM6btGVNvJBAemJJanZqakFqEUyWiYNTqoFp6ewFx7oPqq21r7jBrlCj
 n5WYzC0f/EV9xe6sc57KYp9qXtee+WuziKtld5LHQildi+cpZ/v2sK36WqCryF/IrLf37o7V
 yx1id0neO67E9fVV6pWAL2GTFFaKWU49vuQlY/6cBmmpyHlCxhJvN75cwPRgh/fJfc9PPv3c
 02HDyCfVva/h4MkVHTGzsleEODkmK3Ms85R681fnRpHxzIb/DjubLpy5fbpTbI4GkyK/Wv1G
 sz9Vh+3PK/Pu13rxz3qeUNWpki9LOR73ciU1XBJWNHz5s1LuxeMNO74/FTrB/yhJbdsC19aL
 v4RF35f+lv6S/yX21+ppX8/N6+/N4rTb+CnvxK/E1r8H67gmuFVNV2Ipzkg01GIuKk4EAFnf
 dnD5AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBIsWRmVeSWpSXmKPExsVy+t/xu7pLP6gkGpw6qW/Re+4kk8XyM+uY
 La58fc9m8Xz+OkaLk2+uslh0TlzCbnF51xw2i4Uft7JYzPjxj9HiUF+0xadZD5ktVvzcymjx
 c9c8FostbyayOvB5vL/Ryu5x59x5No+ds+6ye8zumMnqsXjPSyaPExMuMXncubaHzWP7twes
 HvNOBnrc7z7O5LFk2lU2j82nqz0+b5IL4I3SsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQz
 NDaPtTIyVdK3s0lJzcksSy3St0vQyzj75ip7wT2FimfNt9kbGG9LdjFyckgImEgsWX+QtYuR
 i0NIYCmjxNmZX1ggEuISu+e/ZYawhSX+XOtigyh6yyjx9Ng9VpAEr4CdxJ1zV5lAbBYBVYn3
 hx4zQ8QFJU7OfAI2SFQgQWL34S52EFtYIFai4dN5sDgz0IKmLyvB5ogI/GWW+LIoFiLuKHFz
 6jGoi3YzSjzYewGsmU1AU+Lv5ptAV3BwcApYShxeGA5RbybRtbWLEcKWl2jeOpt5AqPQLCRn
 zEKybhaSlllIWhYwsqxiFEktLc5Nzy021CtOzC0uzUvXS87P3cQITALbjv3cvINx3quPeocY
 mTgYDzFKcDArifD+ZVJOFOJNSaysSi3Kjy8qzUktPsRoCgyLicxSosn5wDSUVxJvaGZgamhi
 ZmlgamlmrCTOu3XumnghgfTEktTs1NSC1CKYPiYOTqkGJpfmlTWc8/Tm1V2sF3UJq5Pfpzt3
 Ef+RI7sb9Pm8iq7p2qY29BRI9+/nWzrLqMb5m9W+e2oLZ6xb28l05l/X5W2rrh7d1abBty7w
 YXm/bG4E86EPauelNjmHTDoW8/v0Ao+0tE0Xtzts3Fq6OVlo76F5G/9uCtIPq1s6vVArljX/
 1+cMhXdJEpu5+ypyZVcF776roRnt7XCqtT476+oa0/SdCdttvzJUV24w+V1+4Knjqxzjao+Q
 QvXt8ycq1LaecX0Uk/tF8a31Jnul3lNS79Il3ZXjX0wwPfH2iveXU7pfig3OeUycu8juZe78
 JtEen3Uvf3S911P2aQ718sl8cPt34uyYE8HdHkm+9962KbEUZyQaajEXFScCAL+ehLaLAwAA
X-CMS-MailID: 20210824131413eucas1p1cf4b3d3d6168b1cbfa6f795eb561178b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210823084802eucas1p2a46bef1b5dd44f1738761f1ae605722c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210823084802eucas1p2a46bef1b5dd44f1738761f1ae605722c
References: <20210823084723.1493908-1-maxime@cerno.tech>
 <CGME20210823084802eucas1p2a46bef1b5dd44f1738761f1ae605722c@eucas1p2.samsung.com>
 <20210823084723.1493908-7-maxime@cerno.tech>
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


W dniu 23.08.2021 o 10:47, Maxime Ripard pisze:
> In order to avoid any probe ordering issue, the best practice is to move
> the secondary MIPI-DSI device registration and attachment to the
> MIPI-DSI host at probe time. Let's do this.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/gpu/drm/bridge/parade-ps8640.c | 93 ++++++++++++++------------
>   1 file changed, 51 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 794c9516b05d..37f7d166a3c6 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -213,52 +213,10 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
>   				enum drm_bridge_attach_flags flags)
>   {
>   	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> -	struct device *dev = &ps_bridge->page[0]->dev;
> -	struct device_node *in_ep, *dsi_node;
> -	struct mipi_dsi_device *dsi;
> -	struct mipi_dsi_host *host;
> -	int ret;
> -	const struct mipi_dsi_device_info info = { .type = "ps8640",
> -						   .channel = 0,
> -						   .node = NULL,
> -						 };
>   
>   	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
>   		return -EINVAL;
>   
> -	/* port@0 is ps8640 dsi input port */
> -	in_ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
> -	if (!in_ep)
> -		return -ENODEV;
> -
> -	dsi_node = of_graph_get_remote_port_parent(in_ep);
> -	of_node_put(in_ep);
> -	if (!dsi_node)
> -		return -ENODEV;
> -
> -	host = of_find_mipi_dsi_host_by_node(dsi_node);
> -	of_node_put(dsi_node);
> -	if (!host)
> -		return -ENODEV;
> -
> -	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
> -	if (IS_ERR(dsi)) {
> -		dev_err(dev, "failed to create dsi device\n");
> -		ret = PTR_ERR(dsi);
> -		return ret;
> -	}
> -
> -	ps_bridge->dsi = dsi;
> -
> -	dsi->host = host;
> -	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
> -			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> -	dsi->format = MIPI_DSI_FMT_RGB888;
> -	dsi->lanes = DP_NUM_LANES;
> -	ret = devm_mipi_dsi_attach(dev, dsi);
> -	if (ret)
> -		return ret;
> -
>   	/* Attach the panel-bridge to the dsi bridge */
>   	return drm_bridge_attach(bridge->encoder, ps_bridge->panel_bridge,
>   				 &ps_bridge->bridge, flags);
> @@ -305,6 +263,53 @@ static const struct drm_bridge_funcs ps8640_bridge_funcs = {
>   	.pre_enable = ps8640_pre_enable,
>   };
>   
> +static int ps8640_bridge_host_attach(struct device *dev, struct ps8640 *ps_bridge)
> +{
> +	struct device_node *in_ep, *dsi_node;
> +	struct mipi_dsi_device *dsi;
> +	struct mipi_dsi_host *host;
> +	int ret;
> +	const struct mipi_dsi_device_info info = { .type = "ps8640",
> +						   .channel = 0,
> +						   .node = NULL,
> +						 };
> +
> +	/* port@0 is ps8640 dsi input port */
> +	in_ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
> +	if (!in_ep)
> +		return -ENODEV;
> +
> +	dsi_node = of_graph_get_remote_port_parent(in_ep);
> +	of_node_put(in_ep);
> +	if (!dsi_node)
> +		return -ENODEV;
> +
> +	host = of_find_mipi_dsi_host_by_node(dsi_node);
> +	of_node_put(dsi_node);
> +	if (!host)
> +		return -EPROBE_DEFER;
> +
> +	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
> +	if (IS_ERR(dsi)) {
> +		dev_err(dev, "failed to create dsi device\n");
> +		return PTR_ERR(dsi);
> +	}
> +
> +	ps_bridge->dsi = dsi;
> +
> +	dsi->host = host;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
> +			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->lanes = DP_NUM_LANES;
> +
> +	ret = devm_mipi_dsi_attach(dev, dsi);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>   static int ps8640_probe(struct i2c_client *client)
>   {
>   	struct device *dev = &client->dev;
> @@ -371,6 +376,10 @@ static int ps8640_probe(struct i2c_client *client)
>   
>   	drm_bridge_add(&ps_bridge->bridge);
>   
> +	ret = ps8640_bridge_host_attach(dev, ps_bridge);
> +	if (ret)
> +		return ret;


I do not see drm_bridge_remove on error path, the same for sn65dsi83.


Regards

Andrzej


> +
>   	return 0;
>   }
>   
