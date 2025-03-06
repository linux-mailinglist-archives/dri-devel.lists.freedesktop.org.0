Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2363A54DBF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 15:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B414010E9BD;
	Thu,  6 Mar 2025 14:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MEOCD41k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E9910E9BD
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 14:28:24 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5e5491eb379so1105576a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 06:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741271302; x=1741876102; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e0vWWMcXjFfg9c9qiH6NSV7bmKttHRNGNsOhNehrSvM=;
 b=MEOCD41kT6/xPZr6GCXwkZ7/UElfYgJy+KVMLWHPvNe/sGJsXvxaqlKe1mJNxNAEww
 ten6cv8UIn2LBsH5FxZsa2l2IYT5r3DMZAmICwiE0WTPYtYMM1yG24xDLeY1QEnY7/Tr
 vLylxkC7wsUYnQp8FCq2cTJa6ybo9thRJeUYzDlNsbbyfeXzLx9UpS1TAKHYvPXhzkVG
 Xw0T6WC21MFwmaEFtR89iQD+OLnKK+HqLfZOCZAs+9Hh91KSLWZw6P/M1JpGnP1ytDtV
 LO37xnOubzqQ4QoMdxmPwKva8jp4qvkdlAix2pnvSCsbQXP6AMeFRCsL28XMoIE6qfLu
 inhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741271302; x=1741876102;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e0vWWMcXjFfg9c9qiH6NSV7bmKttHRNGNsOhNehrSvM=;
 b=cq/ZgmbXgXRXEHVMkTWBt5ytTjgBX5/i1W35b6Vc9LgcoT/53qKXqhsn5bUgUY7iI5
 2eWvseWnOxDz+P6BNeizKMaijkQOUKltshLBuLAQbiw/0UBRWW5vW03fTi65ikXZ4kPR
 gF99KUHUgrGc4eVB3pgSmdtvldLfpkr46ERn2gFM+hi7ivEmOoMq9quJ/clXYeH6ZexE
 g7kZlwIMNLf5dRcHVdAp7eXnN10TAfp1ACL8s1aypWdV3EhBjwxyh9ng0AcmGDjrU71f
 6KUBprp/4JrcVhJIdNkZ8DsCl2VqSmVV9avEmPH3lcsc7EFTYkHQ5Bf9c09pE1syuXES
 9Mgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTBDXmF/aNfT77IU5kErIigX4quvP8d7o4VV6AHFkwPwGnCiLwb0J3KpoKGFW+gs/t/XwJXgn3494=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxozS2ExfQmPUYbpuWE1ztFuz7dBksJyUz4pwCmAPy/FssZH1Zs
 dcQaqDvz9p5m3ZBqC96Nx2qEVxfA7NrAVS5T2VwuQxvOEWN29u6Py2ZGsQ==
X-Gm-Gg: ASbGncuKIFuSttCo8gaW/mOFYGQy0J7bKr14BxZRq+oHbfOR/N+yjVfBLS3FtNd0IWi
 IaqxF6HkRPsknKeMVxDAcEhNUFRa/kyTw6wAR7b6MjESi0uGRe+fsHQmFaWAT2a5fwIfFd6EPhs
 TbHsTV8EEY+QnkFN91hCUJkudGZd41xGECLSHaoRzTCI7DczZCxjy1m/IdsIC8UM6HTJbvy4f6W
 +Q+Cmyb4t2Vv1J3T3Wnpu+T0WVUC54wH4ekLmL72B03Lveltmqs8oBgzMDBb2JiofDsJ59BA+1m
 X6Fzje5iGRPqvh6arhPFzA5kuEgWRWjpbse/ewuxampqPsvKED5paT7A8FUpo7nTSzg5cOprf5j
 YY8Mjm72T7dwC5RGd7E6PcK3cow==
X-Google-Smtp-Source: AGHT+IFozHswlf0bg9ThZSp1FbgljtVYCPPvnTD1k5tckBB+eJRBJhF1NQdof80kjppsiFvLEvgOsA==
X-Received: by 2002:a17:907:3da2:b0:ac1:e2e0:f8d6 with SMTP id
 a640c23a62f3a-ac20d8bcb19mr672425066b.17.1741271302225; 
 Thu, 06 Mar 2025 06:28:22 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl.
 [89.66.237.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac2399d4ed4sm104210166b.178.2025.03.06.06.28.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Mar 2025 06:28:21 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH 0/6] Add support for RK3588 DisplayPort Controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
X-Priority: 3
In-Reply-To: <252BB2E2-4BC5-4402-953D-F7B30EA5DE14@gmail.com>
Date: Thu, 6 Mar 2025 15:28:08 +0100
Cc: heiko@sntech.de, neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com, devicetree@vger.kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, yubing.zhang@rock-chips.com,
 dri-devel@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>,
 krzk+dt@kernel.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <326B91E9-FB91-43C3-B98B-3EF079F313C6@gmail.com>
References: <25401bfa.291d.19564244e54.Coremail.andyshrk@163.com>
 <75189787-28E1-4FC2-8E10-4960B3877A6F@gmail.com>
 <28b0d3fc.bb3.19568f6b5f8.Coremail.andyshrk@163.com>
 <44213B17-FE14-4FB8-8319-1E31BBF6EAA0@gmail.com>
 <74c154b6.8c50.1956aa8c8d2.Coremail.andyshrk@163.com>
 <1573D5D6-AFED-4D92-8112-B0C6BB52D5FF@gmail.com>
 <46c0d239.a4f5.1956b619b97.Coremail.andyshrk@163.com>
 <252BB2E2-4BC5-4402-953D-F7B30EA5DE14@gmail.com>
To: Andy Yan <andyshrk@163.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
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



> Wiadomo=C5=9B=C4=87 napisana przez Piotr Oniszczuk =
<piotr.oniszczuk@gmail.com> w dniu 6 mar 2025, o godz. 15:08:
>=20
>=20
>=20
>> Wiadomo=C5=9B=C4=87 napisana przez Andy Yan <andyshrk@163.com> w dniu =
6 mar 2025, o godz. 13:15:
>>=20
>> Hi Piotr,
>>=20
>>=20
>>=20
>> Then when you DP cable plugin, you can run command as bellow to see =
if the driver detects the HPD:
>>=20
>> # cat /sys/class/drm/card0-DP-1/status=20
>> connected
>> #=20
>>=20
>=20
>=20
> Andy,
> Thx!
>=20
> With above changes i=E2=80=99m getting =E2=80=9Econnected=E2=80=9D.
> Also it looks crtc gets reasonable mode: =
https://gist.github.com/warpme/d6220e3cc502086a4c95f05bd9f9cf0c
>=20
> Still black screen however=E2=80=A6
>  =20

some additional data point: /sys/kernel/debug/dri/1/vop2/summary=20


working hdmi:

Video Port1: ACTIVE
    Connector: HDMI-A-1
        bus_format[0]: Unknown
        output_mode[f] color_space[0]
    Display mode: 1920x1080p60
        clk[148500] real_clk[148500] type[48] flag[5]
        H: 1920 2008 2052 2200
        V: 1080 1084 1089 1125
    Cluster0-win0: ACTIVE
        win_id: 0
        format: XR24 little-endian (0x34325258) glb_alpha[0xff]
        rotate: xmirror: 0 ymirror: 0 rotate_90: 0 rotate_270: 0
        zpos: 0
        src: pos[0, 0] rect[1920 x 1080]
        dst: pos[0, 0] rect[1920 x 1080]
        buf[0]: addr: 0x00000000017e1000 pitch: 7680 offset: 0
Video Port2: DISABLED




non-working DP:

Video Port1: DISABLED
Video Port2: ACTIVE
    Connector: DP-1
        bus_format[100a]: RGB888_1X24
        output_mode[f] color_space[0]
    Display mode: 1920x1080p60
        clk[148500] real_clk[148500] type[48] flag[5]
        H: 1920 2008 2052 2200
        V: 1080 1084 1089 1125
    Cluster1-win0: ACTIVE
        win_id: 1
        format: XR24 little-endian (0x34325258) glb_alpha[0xff]
        rotate: xmirror: 0 ymirror: 0 rotate_90: 0 rotate_270: 0
        zpos: 0
        src: pos[0, 0] rect[1920 x 1080]
        dst: pos[0, 0] rect[1920 x 1080]
        buf[0]: addr: 0x00000000007ed000 pitch: 7680 offset: 0

