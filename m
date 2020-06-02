Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4491C1EC26A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 21:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EB16E457;
	Tue,  2 Jun 2020 19:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B3D6E1F4
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 19:11:01 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h5so4511768wrc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 12:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hmnxjr4CUh90jHQNGiJRvF6c/o07QoJdzDDQ1PSE6FU=;
 b=YtYnZ8dofaccWAxau5WlmaRmh2xg9+vkX9cbC5BtuGxhDULLasSu747Aun6ywD6f28
 cDyjJ0nvdVAVPi0U8aI8BfbcFNBZuU2lHhlOAt6BrjUjoywvuxb11wDKr1kp0W4AJtBQ
 oX7Y0G1sC9MZBeOuQrciFaEM0uz2YRZ92yZjD3h759IMEXZB6pgfiBVoOVaobqI4mIdV
 KYbIaa5o0uC6Lsc+3uo0kr5UHtCW9B2wzW9oPHq5rzQjuROV/VyKhcAfSmp2dIsYd0ej
 AKqv9bd+OMcAR1CuvCzBkPZ20kFbgXkxl5vd/ymTOj3IBWZkq+2bQlauDlHZ9s7MciXu
 m22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hmnxjr4CUh90jHQNGiJRvF6c/o07QoJdzDDQ1PSE6FU=;
 b=UQSyd3f4m1MaNgeKeYNBDLJlWJjmK0w+y639JxHdBGzF8MWZRTKUNBpe2iDBtEf9Qv
 msJpiu8nWtEHzOsVY/e0v8Mb94aSfEnw5MB8mvN/57Db/A80ez+RwpDwKEPsqg6CESbt
 Xd5+iSPpRwuHMEDDG2dvRVfTXdtYKj4Y4L8853izJXZztaL/VwoV/3W/nCzOPDkZg5X4
 Bqxo0gjCni/F95epRFFi8GNtA71aQtuFrXXCPWHaMj5PRNtWDrG/Za5NcYPt2rS1b44s
 oDjOdZsybAdWB7avyDZdyzPsn/IjJV7NBa/WHFP5OhTGfd3dGPATqS9BmfWdkJH3APPd
 qYBg==
X-Gm-Message-State: AOAM5302gy80VIzp82dgADrtUoIxmrNA2UuUi/w4FuqvnIke8h88yLpY
 PKeiTF6xBpgxHq0fW5ooOi1B3M9wXKhLFJN49KA=
X-Google-Smtp-Source: ABdhPJx75tGc1ZMd87O+Y8nNVtB9v5AS5kxYkfiyeP8KChvGeXJoxqxR35AG/0PJnx7snV1q4BiE+bQAMiKvHpVAPng=
X-Received: by 2002:a5d:400f:: with SMTP id n15mr29277171wrp.419.1591125060403; 
 Tue, 02 Jun 2020 12:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200601114925.GA1626@freedom>
 <CADnq5_OwF7PRqCrPmAYJzxLG-Hv80z4Jv0JaDPMqS3mxqra5FQ@mail.gmail.com>
 <20200602171257.GA310@freedom>
In-Reply-To: <20200602171257.GA310@freedom>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 2 Jun 2020 15:10:49 -0400
Message-ID: <CADnq5_NsFzDnac4WmR8q+dNjRmUhwZXKsYUwuPkY6WqATbHmYw@mail.gmail.com>
Subject: Re: [BUG][AMD tahiti xt][amdgpu] broken dpm
To: Sylvain Bertrand <sylvain.bertrand@gmail.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 2, 2020 at 1:13 PM <sylvain.bertrand@gmail.com> wrote:
>
> bisected: commit 4dea25853a6c0c16e373665153bd9eb6edc6319e
>
> drm/[radeon|amdgpu]: Replace one-element array and use struct_size() helper
> ...
> Also, make use of the new struct_size() helper to properly calculate the
> size of struct SISLANDS_SMC_SWSTATE.

I've gone ahead and reverted the patch.  Thanks for tracking this down.

Alex

>
>
> regards,
>
> --
> Sylvain
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
