Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76420347C8E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A626EC73;
	Wed, 24 Mar 2021 15:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8254C6EC54;
 Wed, 24 Mar 2021 15:26:22 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id c4so18382015qkg.3;
 Wed, 24 Mar 2021 08:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=akWd9UecgJJi22GJMZCCcEB+66p22ov4QxG8/eVZ8SM=;
 b=rHX9x7EGHw6JuVtwxTRJKtf4p2fde38CJnxK9oy1GqBjDA7t2dEMMxP2Q/OwwvXVOC
 YOVh63RlM/gwV+9YvKIkSrknRM5HMgWgpY8lPP2qa1+cT7X+Tz8Qfi9y5gRNyNK4XrFr
 FJjkhg8Stn+MJ0EXxg0x3LRVaidJnf57eYkjC1mfulGqtL2oTmDsZYoiGYUHKru+zfQI
 yQk7hS4Va8fNTZL1umXaodyGFOG/WQTT4qjQJRs+c3rauu0QWPFk8PJl1DFYJ3aH6O4w
 rgAxtIIfWnGfYqIgqLombndI/6CMtRfgvS3ZtwJF58K3qeBmHvCK6cbqdX5294tfdRrg
 siNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=akWd9UecgJJi22GJMZCCcEB+66p22ov4QxG8/eVZ8SM=;
 b=kvVY3o1f8VYxbjeQ81Ps6XWRkF6V9MtOSjDhBOsXp5UVQ5pqB8c5FwD6pI9XCFE4PB
 1SBgMJUJIsGtIAJn6J4irbw5kkDrwbYPgfRGTIKimOE3ud3wgnyLReeSTzJpE933oup+
 Ug5VnGGQxtE5LTpOrGNj94LIjW3YB3ZRzHCfuC+Vg3lNI5i4h59avKFtDUhnyTxFoa3V
 RhQL5QWS3b6nz40FyqU+QUtNcOGtZVyJIcJqQLwspQISV8dzmTdxKA9gxwcirlmkb6dl
 CTQAqw28/jNc1Y8RJgeNfSuOSqiIdW9mnNeRi7xnNIO+rzq0I4vpw4RMykUJI2I/bagL
 5VIw==
X-Gm-Message-State: AOAM533+KlFI8T2d4VV2KQQfd045UjIFS66J+V0F+ApxYjApxPcVVVRi
 q/5+7uGjd3LGfXLHHRLS+vDz0OsXMSuqaxiDwKPDeE1+YOU=
X-Google-Smtp-Source: ABdhPJwhQb9/V0McGNIh1doqZ0fHxay1NCot0OrSqPNK9Lc2dFDYfdz1E4tNVsD4jxQYG+z4CpAxk94C9UR1g5KWxA0=
X-Received: by 2002:a05:620a:13ec:: with SMTP id
 h12mr3490069qkl.460.1616599581743; 
 Wed, 24 Mar 2021 08:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210324121335.2307063-1-tvrtko.ursulin@linux.intel.com>
 <20210324121335.2307063-4-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210324121335.2307063-4-tvrtko.ursulin@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 24 Mar 2021 15:25:55 +0000
Message-ID: <CAM0jSHO7QRw2XeBKA-fASnC--k80WZFB40Bv4KWXvX6JRypPXQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/i915: Restrict sentinel requests further
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 24 Mar 2021 at 12:14, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Disallow sentinel requests follow previous sentinels to make request
> cancellation work better when faced with a chain of requests which have
> all been marked as in error.
>
> Because in cases where we end up with a stream of cancelled requests we
> want to turn of request coalescing so they each will get individually

turn off

> skipped by the execlists_schedule_in (which is called per ELSP port, not
> per request).
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
