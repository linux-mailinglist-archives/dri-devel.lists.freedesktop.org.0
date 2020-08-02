Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D743B23A0D0
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 10:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E796889715;
	Mon,  3 Aug 2020 08:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22CA89FAC
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 08:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596355539;
 bh=sc1Lq8EFToHTdK5q+UaOStFQfDdgf714wGLLqZKqwoY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=aeaoKctDVpeUHPAmtcFrKdeq51XDI04xweIWl2F16QHXj9PmHwY7ImtuqtLcQ404L
 ZoNSNQG3KA50dtvgCtU3Sh8dACc3/CYmOvLgNAIR7un4M5zeHT9eH4XV3eW4tfT8pq
 WFguTteyX8Q+x4g2QdmmWWHKRpLq8IBxeg0j0CPs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.148.8] ([217.61.148.8]) by web-mail.gmx.net
 (3c-app-gmx-bs58.server.lan [172.19.170.142]) (via HTTP); Sun, 2 Aug 2020
 10:05:39 +0200
MIME-Version: 1.0
Message-ID: <trinity-2bdb3521-256a-4d4d-928a-be9b8c179d4c-1596355539029@3c-app-gmx-bs58>
From: Frank Wunderlich <frank-w@public-files.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Aw: Re: [PATCH v2 1/5] drm/mediatek: config component output by
 device node port
Date: Sun, 2 Aug 2020 10:05:39 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAAOTY_8nm0KDHFzOX9+qTTHOUd0Vik063J+rScu_y-hTBTkrCQ@mail.gmail.com>
References: <20200728111800.77641-1-frank-w@public-files.de>
 <20200728111800.77641-2-frank-w@public-files.de>
 <CAAOTY_8nm0KDHFzOX9+qTTHOUd0Vik063J+rScu_y-hTBTkrCQ@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:4FFi9HpCe8lkGtx3qVv8hooKf3hnYGPUlAK5sb6D1cx9f6AKs2Zij3fJVX8u1Kn3vQNVq
 ghyk4N2d0ZnEQ1NBl8Lfkgj5ykKuJZKEOM8PbRHm6zEs1Uir8L3aD8gL7eR7RNmMSZemBSbCpXq9
 u3EFJ4ekTCJo6getq8QxyK/kTZVWz4gM05LhHUOTvEbpq/7bwjk2dCpa0ROeR5Lwdww/Uy7/n1Af
 K1q4PEkOEZregQweoK9VKFwmdH1ziDxUfRSxr6A0VKOv3Qqwt7P78lG5lH1DNZ9xCt8W3qrspwOq
 wY=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EVjTvshynRM=:oj6gH32Ie0JMk3jwUU7SjQ
 L9uQMqjJ5k3YEPDEMXJ6rAjz0+sMxc6rVyEAHpHI1BvB4nFrXBvkvBbchQUq5t7mAFxIgdg08
 ddelQW0Vr16/2ejszizw8Rq4iNbq0jyPXkhgobAtzpXyUn7mpsq58LWHaIKklHI333JX+MLiG
 EQh/VS9Pi6WyoS7/yP9Hw/NGisyRiBwn0pNUf2cx/ok4WFwhUXjcDHxsUq5HUnvEqKZmsIaIE
 VZa5IZBI6DIodDEPHSn9+ov/XZ/VVIO5h49CQTGMh38HIU9xbwNWOyeGAH6UgmjJx5Iww6hah
 awZfuWpOtcon+pq+ByqGNjgQxbwfUliM0boJGG9ODSBLfz8ik146F2K6kEfXMoXmUHAmvzabo
 1qshB/tGhETBWT+fG/c6HaVevZQ7RGHsZ7BjcejSu+LD8tBllAfDz8Hh2cQQJ4mviEWAh8h7J
 Br+88lsiRUgf0imkfW07or2Dov+yJS3D5ewypGtvxHfUqPOSBtuOdJZyMen0goNF6Dc9WbLqn
 acd6E4eSrWANevczDyij3ZOXsdnhit+400o/KqjRiFN39XlWTRbsMAdBPytmY4UDCEhKyQEKq
 csFR+nzSGWIUIcDzGgWP764XbAh4TLQQsxFETrfoCX8GqlMm9dFCpxTfZl8Ha6USHfYwxxnpw
 zONgSdrYR1KLIUqM4NdBfgV4rSLUlTJE0TWLSoPN4zTfAALibdJbrPmFslogGHrLMLOE=
X-Mailman-Approved-At: Mon, 03 Aug 2020 08:20:37 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Gesendet: Sonntag, 02. August 2020 um 02:03 Uhr
> Von: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>
> An: "Frank Wunderlich" <frank-w@public-files.de>
> Cc: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, "David Airlie" <airlied@linux.ie>, "linux-kernel" <linux-kernel@vger.kernel.org>, "DRI Development" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "Daniel Vetter" <daniel@ffwll.ch>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Bibby Hsieh" <bibby.hsieh@mediatek.com>, "Linux ARM" <linux-arm-kernel@lists.infradead.org>
> Betreff: Re: [PATCH v2 1/5] drm/mediatek: config component output by device node port
> > +
> > +               if (comp_type != MTK_DSI && comp_type != MTK_DPI) {
> > +                       port = of_graph_get_port_by_id(node, 0);
> > +                       if (!port)
> > +                               continue;
> > +                       ep = of_get_child_by_name(port, "endpoint");
> > +                       of_node_put(port);
> > +                       if (!ep)
> > +                               continue;
> > +                       remote = of_graph_get_remote_port_parent(ep);
> > +                       of_node_put(ep);
> > +                       if (!remote)
> > +                               continue;
> > +                       of_id = of_match_node(mtk_ddp_comp_dt_ids, remote);
> > +                       if (!of_id)
> > +                               continue;
> > +                       comp_type = (enum mtk_ddp_comp_type)of_id->data;
> > +                       for (i = 0; i < private->data->main_len - 1; i++)
> > +                               if (private->data->main_path[i] == comp_id)
> > +                                       private->data->main_path[i + 1] =
> > +                                       mtk_ddp_comp_get_id(node, comp_type);
> > +                       for (i = 0; i < private->data->ext_len - 1; i++)
> > +                               if (private->data->ext_path[i] == comp_id)
> > +                                       private->data->ext_path[i + 1] =
> > +                                       mtk_ddp_comp_get_id(node, comp_type);
> > +               }
>
> The port property is not defined in binding document [1], so define it
> in binding document first.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt?h=v5.8-rc7

hi,
would be the following enough for describing the ports?

Port binding
=============

some nodes like

- connector (e.g. hdmi-connector)
- bls (mediatek,mt7623-disp-pwm)
- hdmix (mediatek,mt7623-hdmi)

can have port bindings to connect each other. Each port can have only 1 endpoint

more detail about ports/endpoints in ../../media/video-interfaces.txt
hdmi-connector is described here: ../connector/hdmi-connector.txt

example:

connector {
	compatible = "hdmi-connector";

	port {
		hdmi_connector_in: endpoint {
			remote-endpoint = <&hdmi0_out>;
		};
	};
};


&bls {
	status = "okay";

	port {
		bls_out: endpoint {
			remote-endpoint = <&dpi0_in>;
		};
	};
};

&dpi0 {
	status = "okay";

	ports {
		#address-cells = <1>;
		#size-cells = <0>;
		port@0 {
			reg = <0>;
			dpi0_out: endpoint {
				remote-endpoint = <&hdmi0_in>;
			};
		};

		port@1 {
			reg = <1>;
			dpi0_in: endpoint {
				remote-endpoint = <&bls_out>;
			};
		};
	};
};

&hdmi0 {

	ports {
		#address-cells = <1>;
		#size-cells = <0>;
		port@0 {
			reg = <0>;
			hdmi0_in: endpoint {
				remote-endpoint = <&dpi0_out>;
			};
		};

		port@1 {
			reg = <1>;
			hdmi0_out: endpoint {
				remote-endpoint = <&hdmi_connector_in>;
			};
		};
	};
};

regards Frank
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
