Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE333A1AEB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 18:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B266E0FB;
	Wed,  9 Jun 2021 16:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B506E0FB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 16:29:03 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id q5so26207393wrm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 09:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tGWiX83Hywk9BgCeVsLYFd5tdqdc0fZh1j2g86mM9NQ=;
 b=WjSZMYTEqWPM1HVhG7zxeukpq/DtDZR/ioBAuMiyzXZ3QWKoBIsBANXq0hMARslWSh
 QuKKaF0LwObIHXaXGMEXLzoftLxAKA4QJHXrsrR+gIKtE6N5Zv1OCrY3EL43DEXYt6QW
 ZGCOu+HAwCyI4OmjFlPCaNI18G+ebT9Ol5u9AV2GsiLbefnm/hJXVrbUAmFMjnmHF9CZ
 T3pqhcjBWqmteg90bVFqiLDduluW0BK2ar8uze1sDNRbQhgg9B82g40JCwKfrYyYPp/R
 nyc7OYc6MgCvVuaXm/x0ZCrHF2tt49jM8dB5aYhdYEDD7lGuYCTNk+ctUjQE3FxhjiXG
 vPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tGWiX83Hywk9BgCeVsLYFd5tdqdc0fZh1j2g86mM9NQ=;
 b=IDGKgRX8Xtpnr2elUS0aTljzC1qn6S+mio3IXtFaK5OKMDgyDX1gUIs1IgegsySbDd
 K4PyVmf26/MXSgeWoFo1GUnstwZfGZWedfG+rrvSpUaTWd5Tsuvigm1GiDP52lT9j98s
 kox2kP8ZcMb95g4VIMUojSsXssKOEGTqOuOe8RgWyt++77jRCnFFfIw4bZQrjSR6RMuR
 s/W7MykMmXoWRbZujMGwaWBDJuwqgu85Xp9jB22OXPBoUaB98R5BZCIBukBLcMVozYCD
 XAIz/f9D1U/GaXBex+gRE+r121kqO90284X/ggM2eKZaysNAkfA4FInk3OchYu5T8o+C
 3aTg==
X-Gm-Message-State: AOAM530K/VMAwwo/sVlaV/BB7MRAnCAw17ghSQGvmjCerA37zGYtlUPK
 ttXHUrYsgGQiVRRtrKrYmNZQ/Y57ptZHz0NQNu7H5g==
X-Google-Smtp-Source: ABdhPJyGrufajQ9tkW7Bx2QtFsfOtFOpmrFCXaUC5i0cwvpLayIR5PKpP0lpcQYz0BtBHERd7g1SI98fU+iWRiPMPZQ=
X-Received: by 2002:a5d:66c6:: with SMTP id k6mr739340wrw.6.1623256141950;
 Wed, 09 Jun 2021 09:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210326145139.467072-1-thierry.reding@gmail.com>
 <20210326145139.467072-2-thierry.reding@gmail.com>
 <P6bikxumymMi9GOcPaj_n8vMt5caPR3rWO4Kga8Ud_FNIgytl3ljvnkU6nsyxIwN4VKNmfOfsC4KryzFTObEXjtFDiywRWDtO_ed71g9aj0=@emersion.fr>
 <YF4L3kq9UN6PWh/h@orome.fritz.box>
 <CAPj87rO_RsEPpuC9-DyVEJ=K6OLeknHhOnjvbQ2EEnPPPrq+dg@mail.gmail.com>
In-Reply-To: <CAPj87rO_RsEPpuC9-DyVEJ=K6OLeknHhOnjvbQ2EEnPPPrq+dg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 9 Jun 2021 17:28:50 +0100
Message-ID: <CAPj87rOB8p+WSgVDwRbbLgW-di5qpSTY5Q6cmQYwbwD2Y3wKVA@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] drm/fourcc: Add macros to determine the modifier
 vendor
To: Thierry Reding <thierry.reding@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thierry,

On Tue, 27 Apr 2021 at 19:40, Daniel Stone <daniel@fooishbar.org> wrote:
> On Fri, 26 Mar 2021 at 16:29, Thierry Reding <thierry.reding@gmail.com> wrote:
>> On Fri, Mar 26, 2021 at 02:54:22PM +0000, Simon Ser wrote:
>> > LGTM, thanks!
>> >
>> > Reviewed-by: Simon Ser <contact@emersion.fr>
>> >
>> > Let me know if you need me to push this to drm-misc-next.
>>
>> I do have commit access for drm-misc-next, but I was thinking that I
>> could take this through the drm/tegra tree along with the subsequent
>> patches because of the dependency.
>>
>> Anyone willing to provide an Acked-by for that?
>
> Yep, no harm if that makes your life easier, so for both the patch itself and merging through tegra:
> Acked-by: Daniel Stone <daniels@collabora.com>

Is this still in your queue somewhere?

Cheers,
Daniel
