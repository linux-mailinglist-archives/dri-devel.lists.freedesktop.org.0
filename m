Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D20A9BF7090
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 16:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7EF310E601;
	Tue, 21 Oct 2025 14:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gluNvJUA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0C610E601
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 14:22:17 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-290bcb326deso7560545ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 07:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761056537; x=1761661337; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P5WIVA/nARRWOC5EqOG09KWXJD5Yq2Qj2yqapCxn6Ls=;
 b=gluNvJUAb2Y244N9aZWB808OezCUArh6nXIuMSr/LSqBk4EwzcdUQhrODwqstXnqRt
 DwsTgpEvl79uAmJxf/5QGejPm/wlZ0UW+6cYPCMACL90sVHVFpVWlmeV5MUoYE9tQrbN
 F5pR8WIwERnE4k+P6YZb4rXcdAE3zcqTJRjstzU9QHX8nojivoi+DtxmL5otTnKkiLim
 CirD4WkgSF7cI9sFTHcB4/02HkQ98v/SD441E0TUB3iGj0HlwQNhdsO6HTVRgq0RmXQz
 6yq1yNDW83Yzl8EuM/RVRiq+B0R0UDhld4e5WKzqMLhR8HizGvhcSSsdEIQfCsczeimw
 fFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761056537; x=1761661337;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P5WIVA/nARRWOC5EqOG09KWXJD5Yq2Qj2yqapCxn6Ls=;
 b=LxFf6SI1FWA1UPtc6wADLCFJqOxogb6OLcroWrMR+xMETRT3oafi2pxGw+GIpLD33F
 NZTmsINQYTXUXrJA8tYdxfeFCb3ZLgqqR9tnD2vJ0F+S7xmjqu/v8wOHo7RUAvCR5nRB
 j++z+fuGZkK80vk7kpfAiLFncRXDx81R7lzZvKSW5Sk4xjCkHH1L3HpexqT5KLeUNvU4
 AT9WkGg2j4KUl0wir6ZDKGKiWIt7K8zB42nPt0qnr4/HKkgLSZUR5ak+xxMeycERGJYP
 noATtGqmO/YNm2TI7PqYnNhQCc7RtLxVuXWI7KeicqWmmN1VSsUYzolVIGpDBzEwIxUf
 sqWw==
X-Gm-Message-State: AOJu0YwhSnrsIk2u8GqN31FpqyLfRmGemWWJilM1iT3wlpQc/jsZtySO
 jkcXHBZWZl8y/XTSVPolCSYA/3vZPqXJcUa3G2yq1mlmpLt5JohyKXDHoflw20YODGKB+q3hKyQ
 owS8jVbclCHsZG1DA9zCSNyKDMsZDcsfydw==
X-Gm-Gg: ASbGncsFt3R5kYubkCl3pbg2s1NuBnNFcm5Y4T92tYeMK5XaqRQcfO6dFXd7cFLVSx6
 DCAcyyUsbrbRcLTbK5vuYq1UAbQz1L8P08kxIJPf/1q0kYzI5/VvvQiMKQINawpwebEPZItziI+
 RNBlO8ldMpRbFdMWYi+O4IxSfePwQWASj3EY+6unq8vW+FE79J3xQwh+vGxx4LzfMWU4WtgljaQ
 pjlWX7Iw5Wniur+CHHRcGFo0N761F1OAQNiZnrt29Jcmvtbfds9LpIBB1EA
X-Google-Smtp-Source: AGHT+IHYSU3AW+zLJIYX6EnoySRdBBt4257DlapLrHbBpWnuoZ8OXpVVldvZZfveKYkduJtRF7Piv+WrngeJt7pF6T0=
X-Received: by 2002:a17:903:f83:b0:25c:9a33:95fb with SMTP id
 d9443c01a7336-292d3fc39dbmr21666735ad.8.1761056537254; Tue, 21 Oct 2025
 07:22:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAGkpkRWV2o93Ejrb0YjoPTxVy23U6pYcwGtLOf_y+jPrk4NCtw@mail.gmail.com>
In-Reply-To: <CAGkpkRWV2o93Ejrb0YjoPTxVy23U6pYcwGtLOf_y+jPrk4NCtw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 21 Oct 2025 10:22:05 -0400
X-Gm-Features: AS18NWANAD9QDd62u9c1pvDWSQoperI4OQUXk-SO3HRPHHhrdjxYymRI0FUxyeo
Message-ID: <CADnq5_PWL=ap5ZRow5398HF6svo0sscqhoA=2_-xOyA7kzgxbg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/amd/pm/powerplay/smumgr: Fix PCIeBootLinkLevel
 value on Fiji and Iceland
To: John Smith <itistotalbotnet@gmail.com>
Cc: dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied the series.  Thanks!

Alex

On Tue, Oct 21, 2025 at 5:16=E2=80=AFAM John Smith <itistotalbotnet@gmail.c=
om> wrote:
>
> This series is a continuation of the first patch for fixing the
> PCIeBootLinkLevel value on Fiji, which fixed an issue
> on an environment where PCIe generation switching does not seem to
> function properly, leaving the device stuck
> on PCI Express Gen 1.
>
> changes in v2:
> - Included the same patch for Iceland
> - Reworded the patch messages
