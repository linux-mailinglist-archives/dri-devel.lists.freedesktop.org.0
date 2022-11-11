Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F02626328
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 21:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB6610E8C3;
	Fri, 11 Nov 2022 20:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B385910E8C3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 20:46:13 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id n12so15115124eja.11
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 12:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I9Gsc4vAOXyP9hE0dy07upvJe/x2SdZ67s0li3UeIhg=;
 b=kneG+DA5pe4jdo30hl6hW2O1BMx7Y5I6sjTgS/cI1D5Sj66I+Vd9CMBuuJQo9znbkg
 +GIUPErJIfS7CFRyXdU9fmI0DgfS2JdhXiHrXowZWIgzS6dA2e5L+Dm3YEGX3tbTnk96
 T5KuKk04n75cpDT4R8X/t/WlB0uvIzCf7e5nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I9Gsc4vAOXyP9hE0dy07upvJe/x2SdZ67s0li3UeIhg=;
 b=qZbBFCWzgIi5ND5ydmrOI12Bj7qz1YXlk0IQb4+BxESJtJ8xPzBmTdvrMqesS4brCk
 cWvN4+9swBfhuMoLUl4tbDsef2gY491VbPtw3Vc4ZMxtgaftqSOZfb0jAAMFj83e1UQL
 iBIN7AZHV1DeuXNI8ij/wBoZZcHKPg/WJukIla3s6aRvtKJyosOqtx0yE3sF8pItPD7w
 qJACACUOVjB4RwnXRLjlHZURWmXmTEwg0xSgaqWMHI/UcZCZOoxD/QabvY2OFtepFLTN
 NkMFW/SNFNV2SC1RespZAgeFZ3dWIYXeeoMUgtg5+tpoWhEWs2Hfy28vc+eMI3OvwDYF
 tRlQ==
X-Gm-Message-State: ANoB5plUnNS69drOndhjgmT6uFQKxR2e/LaiKHD8ad5r+kEanBI8gTAT
 9uFCGODstTGoe+2Y4grni2skKJlYBKQInv6j
X-Google-Smtp-Source: AA0mqf6OhWm49ecdnTTuLr1lhVgIqeUrC4ZxnIiwruUvn+YQZTnGUvNbj1kX1wAm4kAgXeBgby9xQA==
X-Received: by 2002:a17:907:8c81:b0:7ad:902c:d158 with SMTP id
 td1-20020a1709078c8100b007ad902cd158mr3443257ejc.121.1668199571627; 
 Fri, 11 Nov 2022 12:46:11 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 ce12-20020a170906b24c00b007addcbd402esm1232554ejb.215.2022.11.11.12.46.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 12:46:10 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id cl5so7856668wrb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 12:46:10 -0800 (PST)
X-Received: by 2002:a5d:694c:0:b0:238:b29e:4919 with SMTP id
 r12-20020a5d694c000000b00238b29e4919mr2219053wrw.583.1668199570136; Fri, 11
 Nov 2022 12:46:10 -0800 (PST)
MIME-Version: 1.0
References: <20221021130637.1.I8c2de0954a4e54e0c59a72938268e2ead91daa98@changeid>
 <e6bc800b-2d3b-aac9-c1cb-7c08d618fc8e@quicinc.com>
 <CAD=FV=V4m5HNavewSTkrh64_BzLAkivR2mRkTQdaxA8k9JKQbA@mail.gmail.com>
 <956de566-d60a-f257-edff-85a2eac06d99@quicinc.com>
In-Reply-To: <956de566-d60a-f257-edff-85a2eac06d99@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 11 Nov 2022 12:45:58 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UUpR9Euq5r+MujO6BdTk2cnWe_0JTdcP_e5RP47apUcw@mail.gmail.com>
Message-ID: <CAD=FV=UUpR9Euq5r+MujO6BdTk2cnWe_0JTdcP_e5RP47apUcw@mail.gmail.com>
Subject: Re: [PATCH] drm/edid: Dump the EDID when drm_edid_get_panel_id() has
 an error
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Oct 25, 2022 at 1:39 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Hi Doug
>
> On 10/24/2022 1:28 PM, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Oct 21, 2022 at 2:18 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> Hi Doug
> >>
> >> On 10/21/2022 1:07 PM, Douglas Anderson wrote:
> >>> If we fail to get a valid panel ID in drm_edid_get_panel_id() we'd
> >>> like to see the EDID that was read so we have a chance of
> >>> understanding what's wrong. There's already a function for that, so
> >>> let's call it in the error case.
> >>>
> >>> NOTE: edid_block_read() has a retry loop in it, so actually we'll only
> >>> print the block read back from the final attempt. This still seems
> >>> better than nothing.
> >>>
> >>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>
> >> Instead of checkinf for edid_block_status_valid() on the base_block, do
> >> you want to use drm_edid_block_valid() instead?
> >>
> >> That way you get the edid_block_dump() for free if it was invalid.
> >
> > I can... ...but it feels a bit awkward and maybe not quite how the
> > functions were intended to work together?
> >
> > One thing I notice is that if I call drm_edid_block_valid() I'm doing
> > a bunch of duplicate work that already happened in edid_block_read(),
> > which already calls edid_block_check() and handles fixing headers. I
> > guess also if I call drm_edid_block_valid() then I should ignore the
> > "status" return value of edid_block_read() because we don't need to
> > pass it anywhere (because the work is re-done in
> > drm_edid_block_valid()).
> >
> > So I guess I'm happy to do a v2 like that if everyone likes it better,
> > but to me it feels a little weird.
> >
> > -Doug
>
> Alright, agreed. There is some duplication of code happening if we use
> drm_edid_block_valid(). I had suggested that because it has inherent
> support for dumping the bad EDID.
>
> In that case, this change LGTM, because in principle you are doing the
> same thing as _drm_do_get_edid() (with the only difference being here we
> read only the base block as opposed to the full EDID there).
>
> Hence,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

I've given this patch a bunch of time because it wasn't urgent, but
seems like it could be about time to land. I'll plan to land it next
Monday or Tuesday unless anyone has any other comments.

Thanks!

-Doug
