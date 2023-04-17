Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A11F06E4E96
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 18:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80E710E400;
	Mon, 17 Apr 2023 16:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E3110E07C;
 Mon, 17 Apr 2023 16:50:41 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id o8so6122784ljp.6;
 Mon, 17 Apr 2023 09:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681750239; x=1684342239;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kwV4R3ak4q89seFXFlkufBWxBxwbeT/d2E4SMIJOWzo=;
 b=OByfnH05hL5hNbMqKGQS8rejNTl8sEmoLojWstKWP+T+sc+EqfyJJK4iPlo+uw+vYt
 jV0FBJXEV39YudDw9YovY9DHWw08JlpMkA05EQzewT663oN071TqTl0XsF6KrOAR72MD
 srt/4lcfEfW9BriPnU6gIFwfUeE8Ac0xqO6nJCOWyM0dPMkQ2tchHc18CgaFxtr1t+d1
 42VLl1R44X4fGWVLYNOCog0Oy2W73yGYEBs4Y/glGJPwhIbJkJwgnuC3ZEAcV8xFKg2R
 IPmTECO0Qgyf9Lj1OjufXnfeVlbdo+o0EQHPa+A2Gzd9bCNV7ZoSdpP/OKUoz+GjkbzF
 mMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681750239; x=1684342239;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kwV4R3ak4q89seFXFlkufBWxBxwbeT/d2E4SMIJOWzo=;
 b=XE08LeViJxBBW2QMfrqrWH97/6fMJ8wi1OvQhqflMgS2dabPBF7YYIRIPPYfyIfaa+
 CiF//jQuT3Q19HPk6qq2QhwJa3WBFmCuEak/AF7UBkSvA3C/dXWEXRY4v8GhDkpnwaKL
 uSDmfkjXrKkdHRVssYr+xTv6TNmR+wyxehv2N3ZC+B/pOPXjiwrfoPeSGlqtU8GevNtC
 SwCCkoG3eFJhYtRSHw1jGPvE+reJ+nEM5jluP9NTmKY6HlnkJ1IynZ8Nq4FQB3WJUQax
 lGXbdCMZRvmrfxlFhdGc6g4jD9XpHzoYVPzK86MNMDrdKgqtYPb8Im7qnZy2g6wEkpFS
 /GfA==
X-Gm-Message-State: AAQBX9e0mUQ6/PMYwdRXVBL190a4foMjhHKu/kPFW4eCLkVtVvh44PNy
 gy/rKIMPivC1E8tgFBXChk7KGJZaxrptt02aoaE=
X-Google-Smtp-Source: AKy350aML3MlWQZTkrvhFBrj1xFkcEwFuF9+3X/N1SK5fJ9H2aAIA+A29aF+IfbNhSzL7iYgQ9OTCJ6YbxJ+ox2Tt4w=
X-Received: by 2002:a2e:9082:0:b0:2a7:6bef:bc7f with SMTP id
 l2-20020a2e9082000000b002a76befbc7fmr4745926ljg.5.1681750238702; Mon, 17 Apr
 2023 09:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <249b7449-c47b-47e6-0582-d87bd323fbbe@igalia.com>
In-Reply-To: <249b7449-c47b-47e6-0582-d87bd323fbbe@igalia.com>
From: Luna Jernberg <droidbittin@gmail.com>
Date: Mon, 17 Apr 2023 18:49:59 +0200
Message-ID: <CADo9pHi-mdWssVYSN6JTi_3QErfjN8SRj3O5hWLvJr7dPhWSkg@mail.gmail.com>
Subject: Re: [Nouveau] XDC 2023: Registration & Call for Proposals now open!
To: =?UTF-8?Q?Samuel_Iglesias_Gons=C3=A1lvez?= <siglesias@igalia.com>, 
 Luna Jernberg <droidbittin@gmail.com>
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
Cc: xorg-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 "board@foundation.x.org" <board@foundation.x.org>, members@x.org,
 dri-devel@lists.freedesktop.org, events@lists.x.org,
 mesa-dev@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 libre-soc-dev@lists.libre-soc.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed up will only attend virtually Online however just fyi

On Mon, Apr 17, 2023 at 1:41=E2=80=AFPM Samuel Iglesias Gons=C3=A1lvez
<siglesias@igalia.com> wrote:
>
> Hello!
>
> Registration & Call for Proposals are now open for XDC 2023, which will
> take place on October 17-19, 2023.
>
> https://xdc2023.x.org
>
> As usual, the conference is free of charge and open to the general
> public. If you plan on attending, please make sure to register as early
> as possible!
>
> In order to register as attendee, you will therefore need to register
> via the XDC website.
>
> https://indico.freedesktop.org/event/4/registrations/
>
> In addition to registration, the CfP is now open for talks, workshops
> and demos at XDC 2023. While any serious proposal will be gratefully
> considered, topics of interest to X.Org and freedesktop.org developers
> are encouraged. The program focus is on new development, ongoing
> challenges and anything else that will spark discussions among
> attendees in the hallway track.
>
> We are open to talks across all layers of the graphics stack, from the
> kernel to desktop environments / graphical applications and about how
> to make things better for the developers who build them. Head to the
> CfP page to learn more:
>
> https://indico.freedesktop.org/event/4/abstracts/
>
> The deadline for submissions is Monday, 17 July 2023 (23:59 CEST)
>
> Check out our Reimbursement Policy to accept speaker expenses:
>
> https://www.x.org/wiki/XorgFoundation/Policies/Reimbursement/
>
> If you have any questions, please send me an email to
> siglesias AT igalia.com, adding on Cc the X.org board (board
> at foundation.x.org).
>
> And please keep in mind, you can follow us on Twitter for all the latest
> updates and to stay connected:
>
> https://twitter.com/XOrgDevConf
>
> Best,
>
> Sam
