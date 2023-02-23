Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD0C6A0BFA
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 15:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F3110E4D9;
	Thu, 23 Feb 2023 14:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D9210E1FE;
 Thu, 23 Feb 2023 14:37:59 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-172663f1956so6504723fac.12; 
 Thu, 23 Feb 2023 06:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=91YG2q+cEf9LhbeISLNpZdyI5nOapixywyeI+07DoSk=;
 b=C8+Oz2K2PQEFT700Do/JODe+tg53ln43KdGHS1UC+94rBMsRlci5AeKgRDU1VlwjYc
 B9AT3MWBpMT3Je0JuXjOjB6iuEz/fhZxN3kE/iMUu+JnKZdoQGqTSAxaK7ZHVEny8Xnx
 w9O+qwG7TJPEjlTC0wu5NsWUCOkYL1mqKSlLJMnFjPcaoIWCXWhtvG36jmD5xeo9iTtC
 sgdVOlaEY5wdEG+NYNpCRSt40aAwM79bA2o8BIR7gfDvKA56xrAFvOb1HB76hcK++uyd
 wN1XdK5Pb8hdWIKCUKKlqnQmZ92TqicYYwBFfbDYWS6d3dr2TSTKGI4sY4g6LuYUMaAa
 m6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=91YG2q+cEf9LhbeISLNpZdyI5nOapixywyeI+07DoSk=;
 b=6BEvQH8w93lcHxU/ezCA3pdsARkg5CBYcUwhY+xAgt6lDgcTWJMb9pXuBu1Hwxq5w2
 OImloF9zerhsCttVSOithmlI9L9WOwOSSSUA613f5weTVbsHPOpronNGWrfZstvR/LTA
 v6+wNtdC68k5tPbfjExjD8wKJAAt/OvV6vOnEwmrXYuvdfvi+n78jDYBLXBg+NxkB3OR
 qGLakDhw6QLRE9ArcSPD+vfhOmOgKaeG2sQhhRL0qie/yahg6gZmX7hKDof/fvAJV5RG
 0NtHzmtViOjwcLtweRH9608BRIopdJ4L69vsjKDj51BkAt+teKHcJPIm2aSEL5zFFQkv
 pNGw==
X-Gm-Message-State: AO0yUKXlkDjISeGUfjy2wQFeRDu8eVFIFXldvPqw8Li09woHO8LpYwB+
 jBvnTUBAVwRTc+1XNCNaj42rmbk4yvBYwB+WLQY=
X-Google-Smtp-Source: AK7set/iTIjGI4DVVf97soJaklnX7qnIM4PXkVT5+cIXHFyAXZ94y+iQ8oEpUWY7kp5i/qwpnX/AMc7SzUm62Nj9jiI=
X-Received: by 2002:a05:6871:6a0:b0:172:3bf5:2855 with SMTP id
 l32-20020a05687106a000b001723bf52855mr1127374oao.96.1677163078416; Thu, 23
 Feb 2023 06:37:58 -0800 (PST)
MIME-Version: 1.0
References: <20230217181409.218008-1-arthurgrillo@riseup.net>
 <20230217181409.218008-4-arthurgrillo@riseup.net>
In-Reply-To: <20230217181409.218008-4-arthurgrillo@riseup.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 23 Feb 2023 09:37:45 -0500
Message-ID: <CADnq5_Ns_Mtr394uUz1oHFngxM0AHkg-7_572bvcp1iD8j3bsw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/amd/display: Remove unused local variables and
 function
To: Arthur Grillo <arthurgrillo@riseup.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: sunpeng.li@amd.com, tales.aparecida@gmail.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, andrealmeid@riseup.net, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks.

On Fri, Feb 17, 2023 at 1:15 PM Arthur Grillo <arthurgrillo@riseup.net> wrote:
>
> Remove a couple of local variables that are only set but never used,
> also remove an static utility function that is never used in consequence
> of the variable removal.
>
> This decrease the number of -Wunused-but-set-variable warnings.
>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  .../gpu/drm/amd/display/dc/dcn31/dcn31_apg.c  | 41 -------------------
>  1 file changed, 41 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
> index 24e9ff65434d..05aac3e444b4 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
> @@ -72,40 +72,6 @@ static void apg31_disable(
>         REG_UPDATE(APG_CONTROL2, APG_ENABLE, 0);
>  }
>
> -static union audio_cea_channels speakers_to_channels(
> -       struct audio_speaker_flags speaker_flags)
> -{
> -       union audio_cea_channels cea_channels = {0};
> -
> -       /* these are one to one */
> -       cea_channels.channels.FL = speaker_flags.FL_FR;
> -       cea_channels.channels.FR = speaker_flags.FL_FR;
> -       cea_channels.channels.LFE = speaker_flags.LFE;
> -       cea_channels.channels.FC = speaker_flags.FC;
> -
> -       /* if Rear Left and Right exist move RC speaker to channel 7
> -        * otherwise to channel 5
> -        */
> -       if (speaker_flags.RL_RR) {
> -               cea_channels.channels.RL_RC = speaker_flags.RL_RR;
> -               cea_channels.channels.RR = speaker_flags.RL_RR;
> -               cea_channels.channels.RC_RLC_FLC = speaker_flags.RC;
> -       } else {
> -               cea_channels.channels.RL_RC = speaker_flags.RC;
> -       }
> -
> -       /* FRONT Left Right Center and REAR Left Right Center are exclusive */
> -       if (speaker_flags.FLC_FRC) {
> -               cea_channels.channels.RC_RLC_FLC = speaker_flags.FLC_FRC;
> -               cea_channels.channels.RRC_FRC = speaker_flags.FLC_FRC;
> -       } else {
> -               cea_channels.channels.RC_RLC_FLC = speaker_flags.RLC_RRC;
> -               cea_channels.channels.RRC_FRC = speaker_flags.RLC_RRC;
> -       }
> -
> -       return cea_channels;
> -}
> -
>  static void apg31_se_audio_setup(
>         struct apg *apg,
>         unsigned int az_inst,
> @@ -113,24 +79,17 @@ static void apg31_se_audio_setup(
>  {
>         struct dcn31_apg *apg31 = DCN31_APG_FROM_APG(apg);
>
> -       uint32_t speakers = 0;
> -       uint32_t channels = 0;
> -
>         ASSERT(audio_info);
>         /* This should not happen.it does so we don't get BSOD*/
>         if (audio_info == NULL)
>                 return;
>
> -       speakers = audio_info->flags.info.ALLSPEAKERS;
> -       channels = speakers_to_channels(audio_info->flags.speaker_flags).all;
> -
>         /* DisplayPort only allows for one audio stream with stream ID 0 */
>         REG_UPDATE(APG_CONTROL2, APG_DP_AUDIO_STREAM_ID, 0);
>
>         /* When running in "pair mode", pairs of audio channels have their own enable
>          * this is for really old audio drivers */
>         REG_UPDATE(APG_DBG_GEN_CONTROL, APG_DBG_AUDIO_CHANNEL_ENABLE, 0xFF);
> -       // REG_UPDATE(APG_DBG_GEN_CONTROL, APG_DBG_AUDIO_CHANNEL_ENABLE, channels);
>
>         /* Disable forced mem power off */
>         REG_UPDATE(APG_MEM_PWR, APG_MEM_PWR_FORCE, 0);
> --
> 2.39.2
>
