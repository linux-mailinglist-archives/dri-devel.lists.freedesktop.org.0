Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF4963CB11
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 23:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EDC10E272;
	Tue, 29 Nov 2022 22:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1A710E09C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 22:28:55 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id e13so21730330edj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 14:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Z6DufAiLbikmJOcyvk/dpsDJdo2Yt6A4Va3UXdp6vn4=;
 b=bSbgHd7hgJCYLmAci5POgq7c9xzACAr/4CJtpAngdgrdC6coYb8uiZu2XqhLPmbQXT
 A7Azk3Hr3Y/t/ycCWOsv4JwIcmu4zG7GiR/cpPTpXl4AEw53lgECOhpbLTQ+zR5Da3se
 TdJURnDO7SI7EL6/spaUEq/f30sbEP7S4gDAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z6DufAiLbikmJOcyvk/dpsDJdo2Yt6A4Va3UXdp6vn4=;
 b=zx9OWzLZwwOkW+WjcbOw6Y+vsetuSEenFHxVfPnYdEfkfkjpXGV3eMjuaIk8/ukZN+
 Obd/6Jn4MaR6m/d8gJ+NTAob6G3KVgSBXimeE38Sbwdna7CCFqbPDyG4scYXcNbmyOMq
 X0jJdGeYxqBPZEIKidAtefiag3qqw9y7znNP+0jF2UHwdOnoV7liZtGH6Y5WaxB2Mw2f
 4qMGPvzIPBjXGhvy0UwSsyP34+GmAlBmhX9verPEgunbpXcxQ1sNlVFWLXsoHhax/DZd
 9qvk88w5GLPGbgojQ4qdZgR5gD4DFq2h8CZHmp+3VVQexuNDCL80xixDlbJGNH5h3Wwk
 eUxA==
X-Gm-Message-State: ANoB5pkt5f8jHaR413mI2koxjPjGyKIvSZL6Gxh/wcv6X6Ce1wZsy/S1
 9J1Z8ClmJuPaxWM9sJ/1byh+nRo6U0POfC1z
X-Google-Smtp-Source: AA0mqf74nhgDKYm8CX8/AscmCezXW4AopHqxKF2+TJF6KVz/gsdsRX+ylbxb/eOuSJo9vH3heDU0Xg==
X-Received: by 2002:a05:6402:114f:b0:462:1e07:1dd7 with SMTP id
 g15-20020a056402114f00b004621e071dd7mr54412943edw.293.1669760933659; 
 Tue, 29 Nov 2022 14:28:53 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 g10-20020a17090604ca00b007828150a2f1sm5033813eja.36.2022.11.29.14.28.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 14:28:52 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id m19so2835665wms.5
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 14:28:52 -0800 (PST)
X-Received: by 2002:a05:600c:3109:b0:3cf:5731:53db with SMTP id
 g9-20020a05600c310900b003cf573153dbmr47280161wmo.85.1669760931831; Tue, 29
 Nov 2022 14:28:51 -0800 (PST)
MIME-Version: 1.0
References: <20221117133655.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid>
 <20221117133655.2.Iebd9f79aba0a62015fd2383fe6986c2d6fe12cfd@changeid>
 <CAD=FV=XzzS-kygLun7u7XMDVqLdtBtxfhdHP0YFQo4TxCTPkSA@mail.gmail.com>
In-Reply-To: <CAD=FV=XzzS-kygLun7u7XMDVqLdtBtxfhdHP0YFQo4TxCTPkSA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Nov 2022 14:28:39 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XGQr9iMBoTPRmaiV3rnK2QNJEZ5C9DhgVuWvVJ8mBGmQ@mail.gmail.com>
Message-ID: <CAD=FV=XGQr9iMBoTPRmaiV3rnK2QNJEZ5C9DhgVuWvVJ8mBGmQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/panel-samsung-atna33xc20: Use ktime_get_boottime
 for delays
To: Drew Davenport <ddavenport@chromium.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Nov 17, 2022 at 1:14 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Nov 17, 2022 at 12:39 PM Drew Davenport <ddavenport@chromium.org> wrote:
> >
> > ktime_get_boottime continues while the device is suspended. This change
> > ensures that the resume path will not be delayed if the power off delay
> > has already been met while the device is suspended
> >
> > Signed-off-by: Drew Davenport <ddavenport@chromium.org>
> > ---
> >
> >  drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
>
> You could have carried over from v1 [1]:
>
> ...which I guess also means that technically this series should have
> been marked v2, but not a huge deal.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> [1] https://lore.kernel.org/r/20221110145102.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid

Pushed to drm-misc-next:

62e43673ca84 drm/panel-samsung-atna33xc20: Use ktime_get_boottime for delays
