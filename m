Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA8D138679
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 13:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79836E507;
	Sun, 12 Jan 2020 12:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B096E4C9
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2020 11:09:34 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id x123so4108610vsc.2
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2020 03:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ia6q4ybn57Ugn7orz9ringH4sLUA1uWAxnMAAROkQoQ=;
 b=NTMWZnL2upX92gqQHaw+lil81FY0kdmPHhC/K0CZ74ehv+a+nSn1ScRopHzHqPFfVy
 TWsZklod397vDAxhAtm/ZU75sWgx+2BcUBRLuudJxz9gT9fC4SUvgQ3hPS191gsAg6R2
 dwJN2bgzmX91bRRa1wlVF+7VLERwb9c2DcVhp93Z90hRfT1YEc3OxNK3U1XNa62aGrk+
 Q2z7unixXtkjZ37arUOsWnheGBB55RLzf7Pgl+fcCLqz7pRY3HzQAUosBxbd4MjBD4Az
 WzEWFrcjHaaPH6c+97PwX18p0h+vMEYzNA+3FrIZhNjEMxofLyWAjq419gAL9yFQln9J
 92QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ia6q4ybn57Ugn7orz9ringH4sLUA1uWAxnMAAROkQoQ=;
 b=EawlPqPXzW4x1+CL8lRpj4r8mUANm/pLEmpAW27icyPKEr4XEUVnszRgMRvgBUN4lj
 SEXTNH5S9q07F3si9bR7g+zboljmoo2DT+DSegp6kwNl39RuHwOUvgexxVuENbjkBEyH
 Dh13egAe1/Qay91EmkMEhmdgh4EdIsVK39B+e7E4W78POrB3znolboPQdRWYX7gqUjO3
 1DeyvIv1uHsengrCWNNcX3K7gvdYU3lNwzlESA8/4diIXrBge2ZPBQu9QFj/g4w6vaQX
 6mN3iHuyu9zq50xjfcSj9Kwh7R8HcrDIL6c6RXdHnwUEb9whC2qb2lsrG8iGbMcuEBgJ
 TV5g==
X-Gm-Message-State: APjAAAUDMcOYBvio3PFuRtMM1TyT+5yP2csVkZYS+MlHJtnDrnJHk/n6
 ZE1dNX8D4q8ra0VReFhF8NsMvt4G1sDZKSduvqjwFHDe
X-Google-Smtp-Source: APXvYqxcj4qDBrjC9jRDYGaaEsrnnWJz52gGGw+ek8Y9Iy85Da7sBQ/7XH5HxJdaoHzOtLBFn9kBHAyzRX/Hr+IF3XM=
X-Received: by 2002:a67:f51a:: with SMTP id u26mr3426257vsn.11.1578827372931; 
 Sun, 12 Jan 2020 03:09:32 -0800 (PST)
MIME-Version: 1.0
From: Patrick Bourgeois <patrickbourg70@gmail.com>
Date: Sun, 12 Jan 2020 05:08:14 -0600
Message-ID: <CAHDRyzoSvjFuUTLkrTPo3dX1naNfaUxZ9ADO15N+UC3vwBHtLg@mail.gmail.com>
Subject: Re: [PATCH v1 09/16] drm/tegra: fix opencoded use of drm_panel_*
To: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Sun, 12 Jan 2020 12:36:09 +0000
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
Content-Type: multipart/mixed; boundary="===============0656852770=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0656852770==
Content-Type: multipart/alternative; boundary="000000000000b9ae8b059bef64d2"

--000000000000b9ae8b059bef64d2
Content-Type: text/plain; charset="UTF-8"



--000000000000b9ae8b059bef64d2
Content-Type: text/html; charset="UTF-8"

<div dir="auto"></div>

--000000000000b9ae8b059bef64d2--

--===============0656852770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0656852770==--
