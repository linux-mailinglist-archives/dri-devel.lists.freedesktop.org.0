Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC6E46EE9C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:57:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23ECD10E450;
	Thu,  9 Dec 2021 16:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDEAD89CF6;
 Thu,  9 Dec 2021 13:08:26 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id z9so5192171qtj.9;
 Thu, 09 Dec 2021 05:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XKC8StNsMWf4SZaMZ42oim205bUQIGLe6F/wtQlcCz8=;
 b=JPWGhTNC9BKf8LG2BDwfQ23kJL6pKlKK8uprO0Q5gNQABFUMKvuEFdVoYRxiLTME04
 BcJwUEGCTtovCm4XtvX3BSzFute8y2vDIJc7D3RPpK5VgX+4N0yITjFyocT4h1Ht/Wug
 o4aC36CjiD3A6P8IJEWz1BMX3Dtq/OLHv2JgN/Hsc9TWAKl1gk9v4TBED49MFOXfuTK2
 wc7BFc9K0g/52AancLWbhfFymw7u28Dqv5YVzjy3Cnn+7no7glCkZ18Pgu+bbk34ukbV
 90FtBwkl3HG9zU96AYo6TYgHr1YNXcsf27Q1Rl7Ci7EmxHpuw2HILEWpuylaMefOa+t0
 RRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XKC8StNsMWf4SZaMZ42oim205bUQIGLe6F/wtQlcCz8=;
 b=wn6nWFg0x+03Ek6I7uCzhNMVmbEofbeRCUeynIvzlEuuYmVlCxfRYB6rmTWJ7x/Cfn
 MfECmCt8Ugpnt78G1QYXFU4Fhtm/qewOT5dplY5Y6qVm7HUXVf0kqUPpu5NtIQDYl9an
 chB8bS5XxUyF4Nt0YGaN8d7sboFlKBuDfZ1O7zaox23SkBlcNB7gAa6Ps8MroS0j+rzT
 7bZXTpTcYsAUULtrn1vqrooTyo2/GLpJqEo78I4naDfLrBiAWxfvtXa84NFS+oOamM5G
 Swhcw6PljhZOG2xy0H8DCy4JOMlrbH0PYErtu+91xiBp/RU5d903UuP0MdlLlXhHRwYj
 Ppjw==
X-Gm-Message-State: AOAM532GxGvRJabCYJ9g6MEQ7UHGzsL+wQfHsmjO/d+3JAtewezby9qq
 YgDNfDp9qg3FP+7NErDcM7kY6eeZ4jcHpJPFg/8=
X-Google-Smtp-Source: ABdhPJxpVIfZt4ho3GNzj9G1NbPkluV+nMYdDyWqSRktSl53aQNyVZjyVkzqcvWuQFp6K5o32R4YlHCHdDM8MqINlWo=
X-Received: by 2002:a05:622a:1990:: with SMTP id
 u16mr17157681qtc.355.1639055305916; 
 Thu, 09 Dec 2021 05:08:25 -0800 (PST)
MIME-Version: 1.0
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
 <20211129134735.628712-15-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211129134735.628712-15-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 9 Dec 2021 13:07:59 +0000
Message-ID: <CAM0jSHOeex+25VOJW-4KHrNNj8FW=nJc1EZigi7K4C2C=UvP=g@mail.gmail.com>
Subject: Re: [PATCH v2 14/16] drm/i915: Remove assert_object_held_shared
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Nov 2021 at 13:57, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> This duck tape workaround is no longer required, unbind and destroy are
> fixed to take the obj->resv mutex before destroying and obj->mm.lock has
> been removed, always requiring obj->resv as well.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
