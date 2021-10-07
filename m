Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C21B6425AE4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 20:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505326E5A5;
	Thu,  7 Oct 2021 18:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A916E58E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 18:36:34 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id s24so10251723oij.8
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Oct 2021 11:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=DPdfz9LhT10yj1lJd14D9Hv0w+VSu7/Sd0PK057Fl6c=;
 b=n6Udo2L3qo9ewMgIMq6Wrg7OauFR7+TAdle2qBkii7z5UBvbpCoYA9B5dQnhx3GIBd
 9wLuYh4nmPIVfNlB+L/C6J7vH6upTD6cMqTPd/1pT4Ha8nX+FKMMVYB575+4dtNw6ahN
 JgO8vUqKyWCgtonWsz1UR0AlRLIq/HUinMtkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=DPdfz9LhT10yj1lJd14D9Hv0w+VSu7/Sd0PK057Fl6c=;
 b=PPZUT5Wv3I7iXQZOVQDI+XAAE/ajYAhEj48hidNrkCeTFMcuUfW6AlGrorkMo446eL
 VCTJ3G79/MaJ0rs6kOdRCW7kdSQ9NBYeACrQuhxA0GpnRu/N+g0nbKp93na8GMTU3z88
 a5BClxSxH9E+U3II9tYtr4Lls4pHPvw0gyDqaCQoMkYBxgcBiWTLeX0tTQr5rvlBlL1n
 a22VQucZvn6ARITM/2uo7IlH4otPQkKx7VxTxrDueGGC//NNU8fM/4Xq3rh+Ieo0hPAG
 Y/P6pbGf9W2pFbChFFXPElf2Dyq4w+oayF6ZDSH8RDVnICtYdZ+T44Le1Cs3i1UgN6KJ
 0QOQ==
X-Gm-Message-State: AOAM5309yRIvpqMDVwLuVTHTVXVEhkZ1M07Y6iOf11EYhoirB4ZBsUFL
 GuCt7u5XYAwhNoNai2/artdoaSJFFARgGnJjMcrF/A==
X-Google-Smtp-Source: ABdhPJxnk8wPPWLKoztpzfVpE4n3ciqpxU3bIEXabE4aZHMsOYfoUNUAEeSniGODpn7Ty3KRhEyp+3b/mIQHV2sfOdA=
X-Received: by 2002:aca:42d7:: with SMTP id p206mr13154401oia.32.1633631794025; 
 Thu, 07 Oct 2021 11:36:34 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Oct 2021 14:36:33 -0400
MIME-Version: 1.0
In-Reply-To: <YV5KpZJJIk46Nge4@pendragon.ideasonboard.com>
References: <20211006193819.2654854-1-swboyd@chromium.org>
 <20211006193819.2654854-2-swboyd@chromium.org>
 <YV5KpZJJIk46Nge4@pendragon.ideasonboard.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 7 Oct 2021 14:36:33 -0400
Message-ID: <CAE-0n50nb4n4QZzKbCmKbutHWPogKrEyCvW_9M6+xHs7WFiibw@mail.gmail.com>
Subject: Re: [PATCH v2 01/34] component: Introduce struct aggregate_device
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Laurent Pinchart (2021-10-06 18:17:25)
> Hi Stephen,
>
> Thank you for the patch.
>
> On Wed, Oct 06, 2021 at 12:37:46PM -0700, Stephen Boyd wrote:
> > Replace 'struct master' with 'struct aggregate_device' and then rename
> > 'master' to 'adev' everywhere in the code. While we're here, put a
> > struct device inside the aggregate device so that we can register it
> > with a bus_type in the next patch.
>
> Not "while at it" please. The signal to noise ratio is very high here.
> Adding the struct device in the structure is the important change that
> needs to be properly reviewed and discussed, the rename is noise. You're
> even adding an IDA and an id without mentioning it at all in the commit
> message. This should be split in two patches, you can decide whether to
> perform the rename at the bottom or top of the series (it would be more
> logical to group all renames together though, there's currently one in
> 01/34 and one in 34/34, so please group them both at the top or bottom).

Got it. I will split the rename from this change and let things lie
until I change that line.
