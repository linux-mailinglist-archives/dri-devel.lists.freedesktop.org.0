Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 450DF17EAB6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 22:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAF66E179;
	Mon,  9 Mar 2020 21:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D856E4BA
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 21:04:58 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 6so1046916wmi.5
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 14:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PPBql3SwnAWXA8bzGM5bAkSVwPmTU0okRlw09OOSTfQ=;
 b=MmExyP/mYk+2OXsRI4sWEDNBuTe0XrTKYZ4cHF/vlRg4JbJykPReC4Kb8vyDHC5YaW
 jvA6Ubv8k4CyajsL7sGjqoU92pUiDmr73cmGD3IBOmLh+JHYmZlOyLjPdlaId2pJQjPq
 YAop7y4iuCxpaqEMf38Y4pgoXaudsMw+2MBH02I78Xv8VXSc6HIa9kCQ9j9ZLae+ceAq
 mpyKlME+5ttvjgs3nsQPhT3zZgDVYTKZ1SeqoE4x0n9QbndliSZ9XOV8ncRujKQlWYdv
 iJllEj7PV/ZQ55CvStyXeES9oUusHJl0fWcNHg/ML4EQNKcgiSzgf5mnBixpdZiThRSL
 3Csw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PPBql3SwnAWXA8bzGM5bAkSVwPmTU0okRlw09OOSTfQ=;
 b=TCwE3fiU8urq9aaGqwL8E4bXmNMzrOz2gCmEqJRYtHyFXW4nVHRInkRMl0vQc/+Miw
 fOu/lAGvvFa/B8HjyAoIP1RyhexvXFzs88EGsTEQ8hGX+Xdf7cqy8qNaE6GWkZ83dlhD
 douwIHO1IMDf1KchDQhWf6zn6pAg/iKeeg6s6LlEYjl4IoLBBXSTQkScBaBKLar0H0fs
 yNnTDQW7JG9jd5t5tDHxdHSkfjfMjd6IKd65B6I7otQ/LJVgFTAQoa/x161izDz/oAkQ
 2RCtCRYupTLDO7wf8xnqb/DTvFP5tPQetDEgrGMAc3SZoH6zsC2KdbI2zRa3Xc7LvvSF
 eqJg==
X-Gm-Message-State: ANhLgQ1gfR53e1dtoL6zSkGJgJh8Nrkj1EkAsAHPWYY38NZ75/jBYGmS
 A1qPhEuW3atls22iSNioNmxsCEp/Kx3WkeE8meQ=
X-Google-Smtp-Source: ADFU+vt867l6+2f6xQRs6lHCyVXlKu6ZX8u2Fkbn27zJpglt9LXymm94ueIRIayE7EahP879gdzct1u7kXjVYQAbarQ=
X-Received: by 2002:a1c:f21a:: with SMTP id s26mr1067033wmc.39.1583787897357; 
 Mon, 09 Mar 2020 14:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200306234623.547525-1-lyude@redhat.com>
 <20200306234623.547525-2-lyude@redhat.com>
In-Reply-To: <20200306234623.547525-2-lyude@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Mar 2020 17:04:46 -0400
Message-ID: <CADnq5_PfLg=Pvcb6SQtaEphxfj9G=Ad2t+oAFBK03rPQTn3vdg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/dp_mst: Rename
 drm_dp_mst_is_dp_mst_end_device() to be less redundant
To: Lyude Paul <lyude@redhat.com>
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
Cc: Sean Paul <seanpaul@google.com>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Mikita Lipski <mikita.lipski@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 6, 2020 at 6:46 PM Lyude Paul <lyude@redhat.com> wrote:
>
> It's already prefixed by dp_mst, so we don't really need to repeat
> ourselves here. One of the changes I should have picked up originally
> when reviewing MST DSC support.
>
> There should be no functional changes here
>
> Cc: Mikita Lipski <mikita.lipski@amd.com>
> Cc: Sean Paul <seanpaul@google.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 6c62ad8f4414..6714d8a5c558 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -1937,7 +1937,7 @@ static u8 drm_dp_calculate_rad(struct drm_dp_mst_port *port,
>         return parent_lct + 1;
>  }
>
> -static bool drm_dp_mst_is_dp_mst_end_device(u8 pdt, bool mcs)
> +static bool drm_dp_mst_is_end_device(u8 pdt, bool mcs)
>  {
>         switch (pdt) {
>         case DP_PEER_DEVICE_DP_LEGACY_CONV:
> @@ -1967,13 +1967,13 @@ drm_dp_port_set_pdt(struct drm_dp_mst_port *port, u8 new_pdt,
>
>         /* Teardown the old pdt, if there is one */
>         if (port->pdt != DP_PEER_DEVICE_NONE) {
> -               if (drm_dp_mst_is_dp_mst_end_device(port->pdt, port->mcs)) {
> +               if (drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
>                         /*
>                          * If the new PDT would also have an i2c bus,
>                          * don't bother with reregistering it
>                          */
>                         if (new_pdt != DP_PEER_DEVICE_NONE &&
> -                           drm_dp_mst_is_dp_mst_end_device(new_pdt, new_mcs)) {
> +                           drm_dp_mst_is_end_device(new_pdt, new_mcs)) {
>                                 port->pdt = new_pdt;
>                                 port->mcs = new_mcs;
>                                 return 0;
> @@ -1993,7 +1993,7 @@ drm_dp_port_set_pdt(struct drm_dp_mst_port *port, u8 new_pdt,
>         port->mcs = new_mcs;
>
>         if (port->pdt != DP_PEER_DEVICE_NONE) {
> -               if (drm_dp_mst_is_dp_mst_end_device(port->pdt, port->mcs)) {
> +               if (drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
>                         /* add i2c over sideband */
>                         ret = drm_dp_mst_register_i2c_bus(&port->aux);
>                 } else {
> @@ -2169,7 +2169,7 @@ drm_dp_mst_port_add_connector(struct drm_dp_mst_branch *mstb,
>         }
>
>         if (port->pdt != DP_PEER_DEVICE_NONE &&
> -           drm_dp_mst_is_dp_mst_end_device(port->pdt, port->mcs)) {
> +           drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
>                 port->cached_edid = drm_get_edid(port->connector,
>                                                  &port->aux.ddc);
>                 drm_connector_set_tile_property(port->connector);
> --
> 2.24.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
