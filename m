Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4748F6C8ACF
	for <lists+dri-devel@lfdr.de>; Sat, 25 Mar 2023 05:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD7A10E05E;
	Sat, 25 Mar 2023 04:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC4D10E05E
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Mar 2023 04:23:02 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id iw3so3623178plb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 21:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679718182;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vgpYKWXzjJN2Yld0pg3hkQUZovUKmsnyiCz0x9041pc=;
 b=BQwlA3JxKsQ/NLXvTODQe/+kSL6/LDn89Lmh56eesDRtuy+wVQTjWJlTKlwCDOOMlN
 ZrRNOCCTpch/KSblLe/3f4byk/RvuV38W96Te2n0NtDp3M6xNg/kwzLyNsJtzqVeeqR8
 PxXy7h8IwhIjfZ4oeopCboNZftkfOlxaXSH1TDXGd/XP2PkaJ2OuWu9omxztCMiApdvE
 98uC3F/PTxJkXVPkr5kZze0MQ0IrJxuvPB73GdELSyCcROzgZGzlfi/mgMJtm6WED61V
 ld/U/rRVX6eRH4YVzWOD5H8HOO1ULHzeqE1vEHvaY4dKxvUlKhcoUC4etBHguOR9X+cx
 4VoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679718182;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vgpYKWXzjJN2Yld0pg3hkQUZovUKmsnyiCz0x9041pc=;
 b=Byz0WJ3MH4kI8DiUoBWwr0MReqaMx+ghNumSTGxOHsQotd+9jx/laPJVmtpDGOOcum
 NOehVxK/MgCtq4hbrMBUPGWf/jLtKrsupS8K+/DiFYvFchi9cvStiV0TBx3A9N0OZYQ8
 2nA2pQU92vb9ojV1UTc0t69zcl4WCilQUHETKeU1/hfS5N/pR+74oGo0T/ET+wCl2ylQ
 bCVbj97K3nWxvsmtGkbmxCDnt6lb3EP5a2ln/tSyNz+gTIU9KCpbK7EZkk3KQGBwYsVk
 RZ8dNkCSW20LjekVwiklXsptRELeEutiG9V/IDl0qIqgqhPbFzwB1CoiDy2R8gtWQQ6r
 TZDw==
X-Gm-Message-State: AAQBX9c9exk9xTZq7G0ZsTRQmCz65I40DzTNVfJfTGvjvIR9zx74ks+Z
 rjtWifXRTodwDVRoZuWclXQ=
X-Google-Smtp-Source: AKy350b7n1hQhN2FdXuCHfv3E6Y+Fsn7JSY9rneZKs9hhy/ARsctLJ+8hbMgU1asbkLh4/wW0M+fUg==
X-Received: by 2002:a17:90b:4d81:b0:23b:3422:e78a with SMTP id
 oj1-20020a17090b4d8100b0023b3422e78amr5152241pjb.6.1679718181842; 
 Fri, 24 Mar 2023 21:23:01 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-18.three.co.id.
 [180.214.232.18]) by smtp.gmail.com with ESMTPSA id
 h7-20020a17090a2ec700b0023b5528b8d4sm3786553pjs.19.2023.03.24.21.22.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 21:23:01 -0700 (PDT)
Message-ID: <fd643854-d687-1dda-f0ae-a6ef06432394@gmail.com>
Date: Sat, 25 Mar 2023 11:22:56 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/2] docs: process: allow Closes tags with links
To: Matthieu Baerts <matthieu.baerts@tessares.net>,
 Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>,
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 =?UTF-8?Q?Kai_Wasserb=c3=a4ch?= <kai@dev.carbon-project.org>,
 Thorsten Leemhuis <linux@leemhuis.info>,
 Andrew Morton <akpm@linux-foundation.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20230314-doc-checkpatch-closes-tag-v2-0-f4a417861f6d@tessares.net>
 <20230314-doc-checkpatch-closes-tag-v2-1-f4a417861f6d@tessares.net>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20230314-doc-checkpatch-closes-tag-v2-1-f4a417861f6d@tessares.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: mptcp@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/25/23 01:52, Matthieu Baerts wrote:
> diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
> index 7a670a075ab6..20f0b6b639b7 100644
> --- a/Documentation/process/5.Posting.rst
> +++ b/Documentation/process/5.Posting.rst
> @@ -217,6 +217,15 @@ latest public review posting of the patch; often this is automatically done
>  by tools like b4 or a git hook like the one described in
>  'Documentation/maintainer/configure-git.rst'.
>  
> +Similarly, there is also the "Closes:" tag that can be used to close issues
> +when the underlying public bug tracker can do this operation automatically.
> +For example::
> +
> +	Closes: https://example.com/issues/1234
> +
> +Private bug trackers and invalid URLs are forbidden. For other public bug
> +trackers not supporting automations, keep using the "Link:" tag instead.
> +
>  A third kind of tag is used to document who was involved in the development of
>  the patch. Each of these uses this format::
>  
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 69ce64e03c70..759c99e34085 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -134,6 +134,15 @@ resources. In addition to giving a URL to a mailing list archive or bug,
>  summarize the relevant points of the discussion that led to the
>  patch as submitted.
>  
> +It might be interesting to use the 'Closes:' tag to close issues when the
> +underlying public bug tracker can do this operation automatically. For
> +example::
> +
> +	Closes: https://example.com/issues/1234
> +
> +Private bug trackers and invalid URLs are forbidden. For other public bug
> +trackers not supporting automations, keep using the "Link:" tag instead.
> +
>  If your patch fixes a bug in a specific commit, e.g. you found an issue using
>  ``git bisect``, please use the 'Fixes:' tag with the first 12 characters of
>  the SHA-1 ID, and the one line summary.  Do not split the tag across multiple
> 

The doc LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

-- 
An old man doll... just what I always wanted! - Clara

