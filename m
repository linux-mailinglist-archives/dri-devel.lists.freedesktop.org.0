Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4B668D3F2
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 11:19:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6785310E1A5;
	Tue,  7 Feb 2023 10:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E39F10E136;
 Tue,  7 Feb 2023 10:19:31 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id w3so16075111qts.7;
 Tue, 07 Feb 2023 02:19:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GAbmluMMZmuve7W2pclzwLq8UAZbC40y33BvSstz+p8=;
 b=eUsdYM5rcOfLw1QdDMHQCcoBLuAcy+OTS1bV7RNcyg/miLm3JrASGxDtytxy4Bv8WP
 jYxGJ0NFDTz+u/3RoyCD4Dr7+5itw9daQJ0TAyAWKacL1BraQd1kOGSvB9lFFmt7D0az
 1xfqOCjKqMOsnXMWiB7uBfoAW/GIwCF5rooVKRzN9DXt651PDYyVrPQ6qsqFmqUQpkqR
 x3/0/3oqO5GVutJ22Ur+Db6fpM6xB2CBSkrTMRZmEiXqrFK0jRSO9wLO0G80CcvOwgif
 RG6iNGpGdIamLfgDS4bCfWEdQ/uUkixVcnZtTt4L1VnUsY3eLt6JkAmqaFLfHPf4X2rN
 PMFw==
X-Gm-Message-State: AO0yUKXkYJtmzhvHAjymm5QUfGa6wLbjBJisxHBQIpFohbnW+4Ok6+U/
 I1IXjUfka9+UO98kUhOqei2gUI8fIPCEPw==
X-Google-Smtp-Source: AK7set9/V5dPa805cK5GINUu1HUZqh1EkuVdx2HDLyobvgScYivOLg7rhEmRTpjENTI5BE5qgPVnSg==
X-Received: by 2002:a05:622a:208:b0:3b6:334b:2cbc with SMTP id
 b8-20020a05622a020800b003b6334b2cbcmr4515037qtx.65.1675765170671; 
 Tue, 07 Feb 2023 02:19:30 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com.
 [209.85.128.173]) by smtp.gmail.com with ESMTPSA id
 m28-20020a05620a13bc00b006fec1c0754csm9062110qki.87.2023.02.07.02.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 02:19:30 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-4b718cab0e4so189408737b3.9; 
 Tue, 07 Feb 2023 02:19:30 -0800 (PST)
X-Received: by 2002:a0d:e9c1:0:b0:514:a90f:10ea with SMTP id
 s184-20020a0de9c1000000b00514a90f10eamr213697ywe.316.1675765170090; Tue, 07
 Feb 2023 02:19:30 -0800 (PST)
MIME-Version: 1.0
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <20230109162140.yelgy2da7aqa6sqv@fsr-ub1664-121.ea.freescale.net>
 <323ec70e-4613-c0e9-0b39-ad2a0a76673d@linaro.org>
 <20230110065712.lgjnmb66s4tlpoly@fsr-ub1664-121.ea.freescale.net>
 <bf92569b-3886-113c-9e27-508e4cbfa4ba@linaro.org>
 <CAMuHMdUbgvT5i4XiJxgKSiRSmFFXO_mMEbgHBgcJDwUPxEYRRA@mail.gmail.com>
 <4bf0e5a2-23b6-1964-b30f-a5cb57f35e68@linaro.org>
 <CAMuHMdXyMJZaeeaLjzhbb_A7_WDcyjAzpKNWG8f5gtvmZLW0AA@mail.gmail.com>
In-Reply-To: <CAMuHMdXyMJZaeeaLjzhbb_A7_WDcyjAzpKNWG8f5gtvmZLW0AA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Feb 2023 11:19:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUgtiuxJ9dnjcGy77onHtrhabT5krJMp2XSr4KOD31ydQ@mail.gmail.com>
Message-ID: <CAMuHMdUgtiuxJ9dnjcGy77onHtrhabT5krJMp2XSr4KOD31ydQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] drm/bridge_connector: perform HPD enablement
 automatically
To: neil.armstrong@linaro.org
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
Cc: dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Tomi Valkeinen <tomba@kernel.org>,
 freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On Tue, Feb 7, 2023 at 11:02 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Feb 7, 2023 at 10:59 AM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
> > On 07/02/2023 10:40, Geert Uytterhoeven wrote:
> > > On Tue, Jan 10, 2023 at 5:37 PM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > >> On 10/01/2023 08:57, Laurentiu Palcu wrote:
> > >>> On Mon, Jan 09, 2023 at 10:26:28PM +0200, Dmitry Baryshkov wrote:
> > >>>> On 09/01/2023 18:21, Laurentiu Palcu wrote:
> > >>>>> It looks like there are some issues with this patchset... :/ I just
> > >>>>> fetched the drm-tip and, with these patches included, the "Hot plug
> > >>>>> detection already enabled" warning is back for i.MX DCSS.
> > >>>>
> > >>>> Could you please provide a backtrace?
> > >>>
> > >>> Sure, see below:
> > >>
> > >> I wondered, why didn't I see this on msm, my main target nowadays. The
> > >> msm driver is calling msm_kms_helper_poll_init() after initializing
> > >> fbdev, so all previous kms_helper_poll_enable() calls return early.
> > >>
> > >> I think I have the fix ready. Let me test it locally before posting.
> > >
> > > Is this fix available?
> > > Do you have a lore link?
> >
> > The fix at [1] has been applied on 2023-01-26
> >
> > [1] https://lore.kernel.org/all/20230124104548.3234554-1-dmitry.baryshkov@linaro.org/
>
> Applied where? linux-next does not have it.

commit cbf143b282c64e59
("drm/probe_helper: extract two helper functions") in next-20230127
next-20230130 next-20230131
commit d33a54e3991dfce8
("drm/probe_helper: sort out poll_running vs poll_enabled") in
next-20230127 next-20230130 next-20230131

but not in any later version?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
