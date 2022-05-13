Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC58525EA8
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 11:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3DC10F13D;
	Fri, 13 May 2022 09:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04CA10F13D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 09:22:23 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id a22so6638713qkl.5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 02:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Wk6/sho0Qd9TQa3MQ3d5o7rj+3fZFRDxiENmEcRCfGM=;
 b=XAKnvzSpVRbvrUw7WgwcL5gkEMAZr8G6D6JzL/9IGq/Y9/kS3Sa+pU9ahtyWk+XzoW
 +mfalTCMfEHMY0PMA4oT7zcfo5SxtsbNtmJsswNKbZmsfmCCVVPO+guYU/XacXjkE6sw
 hZnHogcxAoqIRSGm4da1FIXkocDRJlPHIf4M6q0e3YrI0hcBWDMDIIcNoyIKow4/OXqR
 JOxgdK2PtUAjEBJ/pIryXe8SNoVd19WuK/1FMAapfkPrrgp1sUTUzL+vLbfRhVRn/032
 UPDlW0jSPmVpiosIcGATaY7hFp7jR92VbmBpVqGXLgxqEZ6diJeUEInR2/dnt9qFz5Cs
 MGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Wk6/sho0Qd9TQa3MQ3d5o7rj+3fZFRDxiENmEcRCfGM=;
 b=f/gu12B+9uQigdSmuu4BtG1H0JlIeofrgZEKACTibAOewKz7LVRfTNqAiVwK2Stmks
 cSJ993spjDYUFv3k6SL3fyaRCbpUVDdlq2fzBr4mnlJai62Hyi9UwqprbFhbMrjzniQh
 IWCssGIxnoveUrJeYReRJZDnmI3zhzV1AwFPW8bjQRIhRTWHEbLHm4o0Qy738YI2rGQu
 Flv/25iXPPiO6d1O41zta0FwepNwMeiUf6R9OhFD0sUsiPHcwNSEmyDvLpVSXSkj6frV
 KF692krKlPvQhheXJ54ximRtqLheoHRZmhsYnbMBhhVMyBnWJmcMycxiCMsj+ait7NZc
 bAtw==
X-Gm-Message-State: AOAM530CFT9JVyrTDJKiVPCf57TTN8+0Q1c00sCmL39b1PMA0+9l06wu
 LUVl8nhHelgSXO/76826YXIcX5aHj5TJF5mIyvA=
X-Google-Smtp-Source: ABdhPJwwXXRNdtPBoJX6hJrxR1E+p4nYuz9F0Ay5Eg/0u31Kjkvi79EXOtPTdHdoNvH2n1chO4Pg9C3HT8b6FvgKETU=
X-Received: by 2002:a05:620a:f0d:b0:67e:1961:b061 with SMTP id
 v13-20020a05620a0f0d00b0067e1961b061mr2948676qkl.82.1652433742759; Fri, 13
 May 2022 02:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220509130951.486344-1-christian.koenig@amd.com>
In-Reply-To: <20220509130951.486344-1-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 13 May 2022 10:21:56 +0100
Message-ID: <CAM0jSHOiWtYXAOy_jN_MN-fc8JMWNBxuaZ1bXa5KO3VANP7Eow@mail.gmail.com>
Subject: Re: Improve TTMs empty object handling
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 9 May 2022 at 14:09, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Hi everyone,
>
> re-sending this because Daniel was requesting a background why this is
> useful.
>
> When TTM creates a buffer this object initially should not have any
> backing store and there no resource object associated with it. The same
> can happen when a driver requests that the backing store of an object is
> destroyed without allocating a new one.
>
> This is really useful during initial buffer creation as well as temporary
> buffers and page tables which content doesn't need to be preserved when
> they are evicted.
>
> Currently TTM allocates dummy system resources for that because drivers
> couldn't handle a NULL pointer there. Audit the drivers and then clean
> up TTM to stop making those dummy allocations.
>
> Please review and comment,

Any chance we can throw this at intel-ci? Series seems to apply to drm-tip.

> Christian.
>
>
