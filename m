Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B70134CC31B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 17:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8EA810EAAE;
	Thu,  3 Mar 2022 16:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B128410EAAE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 16:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1646325786;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=V+b7gtifjjWxm7XilkgYKjJIl99IKRCPnUs0sjqsyWU=;
 b=m2i/zKdUKn5s9sRd4TkJVdd4gN4FR2OuFQBeRww2D6kv8pHpP4Gbkz8Pemp4LpxlUm
 7NhHpNBY5aBftalEHEeg/G+uRXaUCSFOIPat3raLwffDK2o4RKJd/+JEehm98C/ENW6S
 6SJ/OE/fGLgz01G9hYjzQPGlmMd4eL+e8Nm1IBmjDoxWce/3RrvQj+am9Hus5btEDBa0
 pNNLQpeyWdRWJD5dYebvEPFpBobSjaxdIJu+s3tfnwaUwPHenA6ypih2YL6LIt4CWlP2
 89kB7tagnbeWWV77sXUrPDSQdK4I8vNaRAm9/VepFpusWebldBPfZuphNw+P+y2Vbifo
 VT/A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw47tT+k="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.40.1 DYNA|AUTH)
 with ESMTPSA id n729cey23Gh60Rr
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 3 Mar 2022 17:43:06 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [Letux-kernel] [PATCH v16 1/4] drm/bridge: dw-hdmi: introduce
 dw_hdmi_enable_poll()
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <C8AE9A7A-E288-4637-ACAD-40CD33CD5F8C@goldelico.com>
Date: Thu, 3 Mar 2022 17:43:05 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <3E620AF4-402E-45EA-9D92-92EAEA9647F5@goldelico.com>
References: <cover.1645895582.git.hns@goldelico.com>
 <e54838849f80454b863f9f5634dd10f79ef7bb8f.1645895582.git.hns@goldelico.com>
 <983e9064-17ad-e646-f37d-ca9173ba0967@baylibre.com>
 <C8AE9A7A-E288-4637-ACAD-40CD33CD5F8C@goldelico.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailer: Apple Mail (2.3445.104.21)
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
Cc: Paul Boddie <paul@boddie.org.uk>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, linux-mips <linux-mips@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

> Am 03.03.2022 um 17:30 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> Hi Neil,
>=20
>> Am 03.03.2022 um 17:23 schrieb Neil Armstrong =
<narmstrong@baylibre.com>:
>>=20
>> Hi,
>>=20
>> On 26/02/2022 18:12, H. Nikolaus Schaller wrote:
>>> so that specialization drivers like ingenic-dw-hdmi can enable =
polling.
>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>> ---
>>> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 9 +++++++++
>>> include/drm/bridge/dw_hdmi.h              | 1 +
>>> 2 files changed, 10 insertions(+)
>>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c =
b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> index 4befc104d2200..43e375da131e8 100644
>>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> @@ -3217,6 +3217,15 @@ static int dw_hdmi_parse_dt(struct dw_hdmi =
*hdmi)
>>> 	return 0;
>>> }
>>> +void dw_hdmi_enable_poll(struct dw_hdmi *hdmi, bool enable)
>>> +{
>>> +	if (hdmi->bridge.dev)
>>> +		hdmi->bridge.dev->mode_config.poll_enabled =3D enable;
>>> +	else
>>> +		dev_warn(hdmi->dev, "no hdmi->bridge.dev");
>>> +}
>>> +EXPORT_SYMBOL_GPL(dw_hdmi_enable_poll);
>>> +
>>> struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>>> 			      const struct dw_hdmi_plat_data *plat_data)
>>> {
>>> diff --git a/include/drm/bridge/dw_hdmi.h =
b/include/drm/bridge/dw_hdmi.h
>>> index 2a1f85f9a8a3f..963960794b40e 100644
>>> --- a/include/drm/bridge/dw_hdmi.h
>>> +++ b/include/drm/bridge/dw_hdmi.h
>>> @@ -196,5 +196,6 @@ enum drm_connector_status =
dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
>>> void dw_hdmi_phy_update_hpd(struct dw_hdmi *hdmi, void *data,
>>> 			    bool force, bool disabled, bool rxsense);
>>> void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data);
>>> +void dw_hdmi_enable_poll(struct dw_hdmi *hdmi, bool enable);
>>>   #endif /* __IMX_HDMI_H__ */
>>=20
>> As I understand, this is because the IRQ line of the dw-hdmi IP isn't =
connected right ? and you use the display-connector ddc gpio instead ?
>=20
> Yes. The IRQ line is not connected on all boards as far as I can see.
>=20
>>=20
>> In this case I think the Ingenic DRM core should call =
drm_kms_helper_poll_init(drm) instead.
>=20
> Ah, that is good. it seems to do "dw_hdmi_enable_poll()" in a more =
generic way.

Well, I looked through source code and it is defined as=20

	void drm_kms_helper_poll_init(struct drm_device *dev)

But there is no direct pointer to some drm_device available.
Neither in dw-hdmi nor ingenic-dw-hdmi.

What should the parameter to drm_kms_helper_poll_init(drm) be?

=46rom comparing code to be able to set mode_config.poll_enabled =3D =
enable it should be

	&hdmi->bridge.dev

but the struct dw_hdmi *hdmi is an opaque type for the ingenic-dw-hdmi =
driver.
So it can't access the hdmi-bridge directly.

What we can do is to make dw_hdmi_enable_poll() call =
drm_kms_helper_poll_init()
or drm_kms_helper_poll_fini().

BR and thanks,
Nikolaus


