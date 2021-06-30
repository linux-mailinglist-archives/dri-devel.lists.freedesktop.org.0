Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3943B852F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 16:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF2B6E9F0;
	Wed, 30 Jun 2021 14:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929B56E9ED;
 Wed, 30 Jun 2021 14:44:26 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id g4so2686096qkl.1;
 Wed, 30 Jun 2021 07:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2et4KT8L7jP1mpy1oRnNKAxEFKAA245RyizNmHQJu0A=;
 b=ni5kdzxQso5O4x03O43MLQ5luCngKEGnziDGHOwB0BDqj2w8T0yFdCUnfEBkT4LhU5
 3Co387LUv4yL5KexqbyNYo9fqQAKxKW+eSWS2hXAtc90q06oIC0oU1chVz9C4lSy/lLF
 /OQMjJHw+qbNSH2jgo99F3czxlceRMq3FZczu67/wzqCYI2l2eNTsoyzQ/Ka7BDShFw/
 KCUkEcOmWzAkFxn73PqFcRzR1lU9HsFozhbKhiuMnHVQ2tlDtoLcyqjWPn9W5OToIJAT
 xxQR1aNiVvNRan1AacNShdz6qjDx1O/gdVc5+tMDkF5Og6nGNcXLk+booiS89NkiUMZO
 Rocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2et4KT8L7jP1mpy1oRnNKAxEFKAA245RyizNmHQJu0A=;
 b=LgNOL+oW2pgREMzrc76irPvu90QbY6bML73/unIvpkMZsrco5utS3BP152A2h2SKh+
 va/mfm56FtNsJ5bz8AbC2hRK6bWBVLfAotk7fgkfzuImbgVlebPiFlWBEwzbn1bEb7N3
 Y0ZHKghmqzxuP4C2U4KJLMYTeUHJE+OMoA6a9345MFb/9iI6GDyz3aiXZZjRkppWWKng
 MK2HEzD2upRDanrIqDdYnNug6kLYJ3unWSixOvisg5+wev6jI+wraHtHiZMNPptxOngo
 Aksq4BMDs5+A2DrQ/MNuGbdm0g7fAhrTjMWwi7WNj8qvxRoQcvN0mC5N0qDMgQpArkh3
 Mrlg==
X-Gm-Message-State: AOAM533KMsuHPb1I3ZHh+jjNVQGefIMl2dTKBn0poR/idfWUK2xQ2fz6
 OWBRDjpRZIu4cZz6liLJ8VF5b+URQ1OVLLXlU5E=
X-Google-Smtp-Source: ABdhPJxiK8zCjwPamhLlfl78bsXkHxIX+9Bmr6sCiaks76JUqJN6r0IHzYOIK1vmUJVT9klXzcEEbEFUWmdzUq/ush0=
X-Received: by 2002:a37:b1c3:: with SMTP id a186mr37560568qkf.17.1625064265801; 
 Wed, 30 Jun 2021 07:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210624193045.5087-1-thomas.hellstrom@linux.intel.com>
 <20210624193045.5087-3-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210624193045.5087-3-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 30 Jun 2021 15:43:59 +0100
Message-ID: <CAM0jSHNDn3Zo3FCeH2LVbnJ1TS+sOuV+Hi=Wdk+yGdkMBQVz1w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/ttm,
 drm/i915: Update ttm_move_memcpy for async use
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Jun 2021 at 20:31, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> The buffer object argument to ttm_move_memcpy was only used to
> determine whether the destination memory should be cleared only
> or whether we should copy data. Replace it with a "clear" bool, and
> update the callers.
>
> The intention here is to be able to use ttm_move_memcpy() async under
> a dma-fence as a fallback if an accelerated blit fails in a security-
> critical path where data might leak if the blit is not properly
> performed. For that purpose the bo is an unsuitable argument since
> its relevant members might already have changed at call time.
>
> Finally, update the ttm_move_memcpy kerneldoc that seems to have
> ended up with a stale version.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
