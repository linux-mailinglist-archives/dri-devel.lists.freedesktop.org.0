Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E310336CA38
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 19:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7BC6E0FD;
	Tue, 27 Apr 2021 17:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4B36E231
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 17:03:44 +0000 (UTC)
Received: from mail-wm1-f69.google.com ([209.85.128.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <marco.trevisan@canonical.com>) id 1lbR7e-0003AH-RO
 for dri-devel@lists.freedesktop.org; Tue, 27 Apr 2021 17:03:42 +0000
Received: by mail-wm1-f69.google.com with SMTP id
 j128-20020a1c55860000b02901384b712094so4261787wmb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 10:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding
 :content-disposition;
 bh=gnEyX5fDEIQaKbYtkkxkqc3nHbncbHwyaQBt7C02tuY=;
 b=gxDIkf6nBT3pDnAZYlg1mPo2PYY8A5pgoBSJbKJsgzk8z+R4p6E1XAX2cqxC1p1tEr
 eckcSh34CHRPCViz4wu+PJg9M9jAEnIceyxXEcFgt5FUKO1CB3K9gvRE1PgL+M0ZDImj
 aDZ+l8yEyXo4PO0lHqiI8AxT+bLgmHdJZo8juox0ZnvhPzurcaSCan4LoBDerHFv5MJO
 NqZO7rM9QNhZZzKvLOgKWAcSOcKB+1HBo0DsIGAgWCZX/f6UYH5vVH8ayiOzBoLMD/kj
 IBSdna/x8jC6Ig28YwGNpIl+l9wR5u6jxiG1oW+hoqd7aINUmNMKPPq9pQHzTzvYNmsJ
 AEDg==
X-Gm-Message-State: AOAM530NryUlcii/bRyaCIWH6pgANgdTB1rYSmzdTMk8csdzVAj9tyWj
 UwR8b7FIk+PQXDj14gE00G+qzxZSu2C12Ih2Oh5wPNE5R9KtVnfYb9pRDifIbdBvM9BTZsALwO5
 N7msBqOwcjSWz9oFl33X9w0BMOMUd55u5I3BvwMVlGD/jlA==
X-Received: by 2002:adf:ab1d:: with SMTP id q29mr10642652wrc.208.1619543022580; 
 Tue, 27 Apr 2021 10:03:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwL0ufwLghuP8tca8A6GO+T2IGUzbrSmZeoJP3/C3qPre2LHA9JV0wX0Ok6IpJiGWrDg6uyaw==
X-Received: by 2002:adf:ab1d:: with SMTP id q29mr10642619wrc.208.1619543022376; 
 Tue, 27 Apr 2021 10:03:42 -0700 (PDT)
Received: from tricky (84.127.144.65.dyn.user.ono.com. [84.127.144.65])
 by smtp.gmail.com with ESMTPSA id b12sm5935152wrn.18.2021.04.27.10.03.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Apr 2021 10:03:41 -0700 (PDT)
Date: Tue, 27 Apr 2021 19:03:39 +0200
From: Marco Trevisan <marco.trevisan@canonical.com>
To: Hans de Goede <hdegoede@redhat.com>
Message-ID: <0D708B40-20DB-4D5C-BFAD-74A30D5DE477@getmailspring.com>
In-Reply-To: <88ad0981-0763-9c8d-fb57-70278bcaffd4@redhat.com>
References: <88ad0981-0763-9c8d-fb57-70278bcaffd4@redhat.com>
Subject: Re: [PATCH v2 0/9] drm: Add privacy-screen class and connector
 properties
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 27 Apr 2021 17:19:24 +0000
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
Cc: "=?utf-8?Q?dri-devel=40lists.freedesktop.org?="
 <dri-devel@lists.freedesktop.org>, Mark Gross <mgross@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sebastien Bacher <seb128@ubuntu.com>,
 Mario Limonciello <mario.limonciello@outlook.com>,
 David Airlie <airlied@linux.ie>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "=?utf-8?Q?platform-driver-x86=40vger.kernel.org?="
 <platform-driver-x86@vger.kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Mark Pearson <markpearson@lenovo.com>, Rajat Jain <rajatja@google.com>,
 Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

>>> There now is GNOME userspace code using the new properties:
>>> https://hackmd.io/@3v1n0/rkyIy3BOw
>> 
>> Thanks for working on this.
>> 
>> Can these patches be submitted as merge requests against the upstream
>> projects? It would be nice to get some feedback from the maintainers,
>> and be able to easily leave some comments there as well.

FYI, I've discussed with other uptream developers about these while
doing them, and afterwards on how to improve them.

> I guess Marco was waiting for the kernel bits too land before
> submitting these,
> but I agree that it would probably be good to have these submitted
> now, we
> can mark them as WIP to avoid them getting merged before the kernel side
> is finalized.

I'll submit them in the next days once I'm done with the refactor I've
in mind, and will notify the list.

And for sure we can keep them in WIP till the final bits aren't completed.

Cheers
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
