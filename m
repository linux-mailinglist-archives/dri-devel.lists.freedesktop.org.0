Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 187C315BA91
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 09:13:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49B36F54E;
	Thu, 13 Feb 2020 08:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4FA6EA92
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 11:32:06 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id s18so1454051iln.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 03:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jhq+F5Vg5gXGVxGGwDzRsCFJAnXHio4Ba0xV8d1yBL0=;
 b=srnvxZf32dbXBAR2MEM61jw+61/pI7td4FK9ZdgDyMp0QtdHGlPNBy/srI2I18KHEy
 EMEQ9341OZ3cRoKeX8R32S5GkitAS+q7fMCGKLg37SuVwmaX8hHlYBR38lWBImfZjPYS
 T4SDTQY51JhRumhmP40nk7NvcMU463kJjwo57HiZp5F53TT0GxursZcOjkLsM99FxN43
 8QccU2bziUos6H+hlNHAtrPprHf98VrqOrG44HDQhpO56gokfkyKANs5YprJN64nnZ3F
 hf1b71J2CNUbl1S5SCYw1LjTU7BhjpZsfTSzuCNKu0TBvtAx4nMIQYIFYpGW/sy5Xx+Y
 J78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jhq+F5Vg5gXGVxGGwDzRsCFJAnXHio4Ba0xV8d1yBL0=;
 b=IDGllyVhG+I1OVJgcodSWFaTkqkF4IB36dePlMPzI0S6WrZ19JqcdCepXYKMyzKZ+W
 j+ucjt6dOpexIQRj1xgY23zpNua97MOc15Wv6rTuyICiSpVYkZ51UQcQeCEOIqvqLcQ9
 cnSimSImARb9WubQ3S874/u1/3aHInnIlp5Qo49steIZPB0U03dsC/MYD2/TbEhT3HL2
 BFb3Uj/J30LfQUX9Os6qTcmS4e/M7vIfAeV++Ju9IwGq/R0XpMLz54N/Gb5VEat4EmRU
 fjZCO2GHxjYdnm/LDQ3FLcwdbhKZQDfbCnLxKwkKFriDgqKhfjGJ/67l/98WlDvLsIgM
 e44A==
X-Gm-Message-State: APjAAAUgl+wEurTHEHYtbhtaKHjJD/tcduysLXnoJANKNXBjMJIZML6d
 EWWK2MKlalwkBLU6nBg4Qt/WegYQ1h3uX+J0oQOdpQ==
X-Google-Smtp-Source: APXvYqyCysF+Xty0Kw6QgHoXI6zCDRRSPRDXxL0EER6sqVcOTJNMCRiWOwxITCc6kPH9uv3UKjyIma87orV8iEBRlE4=
X-Received: by 2002:a92:981b:: with SMTP id l27mr10824698ili.118.1581507125520; 
 Wed, 12 Feb 2020 03:32:05 -0800 (PST)
MIME-Version: 1.0
References: <20200206031752.193298-1-tzungbi@google.com>
 <20200206102509.2.I230fd59de28e73934a91cb01424e25b9e84727f4@changeid>
 <1581495554.22603.2.camel@mtksdaap41>
In-Reply-To: <1581495554.22603.2.camel@mtksdaap41>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 12 Feb 2020 19:31:54 +0800
Message-ID: <CA+Px+wXjC1rchzUGhYYCJVyEbm7RQNFnqf-sQNaky6d82DyLyw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/mediatek: support HDMI jack status reporting
To: CK Hu <ck.hu@mediatek.com>
X-Mailman-Approved-At: Thu, 13 Feb 2020 08:12:52 +0000
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
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Dylan Reid <dgreid@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 12, 2020 at 4:19 PM CK Hu <ck.hu@mediatek.com> wrote:
> I think hdmi_conn_detect() and mtk_hdmi_audio_hook_plugged_cb() would be
> called in different thread. So it's necessary to use a mutex to protect
> this.

Thanks for the reminder.  I feel using mutex here is overkill.  Please
see https://patchwork.kernel.org/patch/11378413/ for my proposed
solution.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
