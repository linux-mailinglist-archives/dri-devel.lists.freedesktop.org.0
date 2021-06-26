Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A99443B4BB1
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jun 2021 02:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7706E12B;
	Sat, 26 Jun 2021 00:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4966E12B
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jun 2021 00:47:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id C44961F40F21
Message-ID: <4445849f5c93b886db207a190d4931fba0ef6b14.camel@collabora.com>
Subject: Re: [PATCH 10/12] dt-bindings: media: rockchip-vpu: Add PX30
 compatible
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Date: Fri, 25 Jun 2021 21:47:19 -0300
In-Reply-To: <176dce10-8e8c-b34b-8b9c-1a0a6a5501ba@collabora.com>
References: <20210624182612.177969-1-ezequiel@collabora.com>
 <20210624182612.177969-11-ezequiel@collabora.com>
 <176dce10-8e8c-b34b-8b9c-1a0a6a5501ba@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Alex Bee <knaerzche@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Thierry Reding <thierry.reding@gmail.com>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>,
 Chris Healy <cphealy@gmail.com>, maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Dafna,

Thanks a lot for reviewing this.

On Fri, 2021-06-25 at 12:21 +0300, Dafna Hirschfeld wrote:
> Hi,
> 
> On 24.06.21 21:26, Ezequiel Garcia wrote:
> > From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > 
> > The Rockchip PX30 SoC has a Hantro VPU that features a decoder (VDPU2)
> > and an encoder (VEPU2).
> > 
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >   Documentation/devicetree/bindings/media/rockchip-vpu.yaml | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> > index b88172a59de7..3b9c5aa91fcc 100644
> > --- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> > +++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> > @@ -28,6 +28,9 @@ properties:
> >         - items:
> >             - const: rockchip,rk3228-vpu
> >             - const: rockchip,rk3399-vpu
> > +      - items:
> > +          - const: rockchip,px30-vpu
> > +          - const: rockchip,rk3399-vpu
> 
> This rk3399 compatible is already mentioned in the last 'items' list, should we add it again?
> 

What we are mandating here is that "rockchip,px30-vpu" can only be used
with "rockchip,rk3399-vpu".

I.e.:

  compatible = "rockchip,px30-vpu", "rockchip,rk3399-vpu";

-- 
Kindly,
Ezequiel

