Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8092D64552D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 09:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0572110E36A;
	Wed,  7 Dec 2022 08:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F44210E036
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 13:47:05 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id 130so14549310pfu.8
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 05:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wzxFZCBzoraY2V2aJ5vahYyGC4X6ZBn5ejuIITSUeJQ=;
 b=BNHuC87nbQ5EmXArJvGmFwGd4+Cg4bKZlsEw8UWkXY6ms8WjfyeIues/6IWds42cY5
 SXkJ2gBqyMjVgmhy32o6rRxc8v+xpXzy1KiZMtsnVgjSztLfH2JOcFZABEKNemvRI79T
 qaEYMwhvQg1GP5L1w05Z/PXSyrajE+q3e4Sp5AARsnlkRcd6Dm8QtwQ6PqDZWALk4mw0
 lBcHT//3A27gCP5TRI4hue84INxEy94YuzQFk/c+VVQ6rsQaoT/EdGu8T9nO2pDWVGWz
 ajMsSYp0xDtrHINM9TRWxN5jgWHA+IrbZz4gKONqwAwWHRXAoG3oTYhAEfhklJhb3f4k
 NpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wzxFZCBzoraY2V2aJ5vahYyGC4X6ZBn5ejuIITSUeJQ=;
 b=ZUYj+PdBuXs7Tp0bMmcfprHaDr2G1vtRP+KYRzammsoNhN9HrJYbHDF2FVhYr5QCxV
 pzlQnxbNAnxP3oUh/ASA5AGEmlSZTs4M604OP+cTXjrd+f6Xy1397PfeXiYNK0/Os0AD
 M9UXbCmuehPW6vKkdRaluGkWczedYElaeDMOBKYtGBS3v3Zbls+kbfUmqtdf2I+hxGks
 iXc2feYx+P1UttZyvVpAc3TSPiVFqoJ+EYexsvCGMkM/y5EiLxelVtkGPD+tbene34tv
 fmFppmr19l/rZEzgTMAtwt1U2kpTKBKmFdcGLchZCoclvPLQt5vJriNYZMRRLBivXJks
 u0Sg==
X-Gm-Message-State: ANoB5pmwP6E0HPILbQLlxvucE8ZgLkwbz0HurK3RuGBRTPx2Nsg6drSg
 Mum6xAWMvkAj8bZb2ccWACyqGuifpqIMaHpU7Yw=
X-Google-Smtp-Source: AA0mqf5CUy25bRhQ4mWWdYmk+FWbfgwGj0JEH91GCe8jevIUfHmf17gq44pE/0RsXvl8m/xd9GO0kG2TIz2J59oVbSw=
X-Received: by 2002:a63:4b24:0:b0:476:e640:d016 with SMTP id
 y36-20020a634b24000000b00476e640d016mr77759265pga.205.1670334425012; Tue, 06
 Dec 2022 05:47:05 -0800 (PST)
MIME-Version: 1.0
From: Genea Maines <realdeal7173@gmail.com>
Date: Tue, 6 Dec 2022 07:46:53 -0600
Message-ID: <CADOB8iy9s4sWuKspNMm8EqehL4_s8Y1aAHWiNpDHezNjqCPXjg@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: Move sysfs work out of DMA-BUF export path
To: daniel@ffwll.ch
Content-Type: multipart/alternative; boundary="0000000000000f21e605ef290aed"
X-Mailman-Approved-At: Wed, 07 Dec 2022 08:08:47 +0000
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
Cc: minchan@google.com, daniel.vetter@ffwll.ch, kaleshsingh@google.com,
 surenb@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, jstultz@google.com, gregkh@linuxfoundation.org,
 hridya@google.com, gregkh@google.com, kernel-team@android.com,
 christian.koenig@amd.com, tjmercier@google.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000000f21e605ef290aed
Content-Type: text/plain; charset="UTF-8"

Wtf yo?

--0000000000000f21e605ef290aed
Content-Type: text/html; charset="UTF-8"

<div dir="auto">Wtf yo?</div>

--0000000000000f21e605ef290aed--
