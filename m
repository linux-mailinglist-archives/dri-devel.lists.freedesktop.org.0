Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F571B671C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:51:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BADE6EA3C;
	Thu, 23 Apr 2020 22:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B75D6E96C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 18:22:26 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id a21so4372540ljj.11
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 11:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SyntY4ihtgwRKYcY/fS0VkFBQ+EsKbXW8mdTDYFHVRY=;
 b=XuX01O+6dLsCQ2wHBfT/Md5wMEKIs4x+9FDt5znXkVYXwA9L6jh5PTYk7ElRxRtiOZ
 WnaFE3eQO694zdBROxNdrjYIR04/XCrUzS08U/t+yVSDi1mxMIphgDRbkZBzVvJE5dqJ
 2YggHL4f/DH+ajJVGkn9ooipwH0cyLUT/5uKH64IrypYLsmQpUq7PY54HS8MxzYmI1Db
 AwK6kct0oI42RU1EKeBu+qMixnzKRmpfrJbsaXdTcG9AthswEJr3302yEC+pt/RASRzz
 xoWFaDI6WKMAkMM1QtuAfB4d4oJbHeiDj4GdVz4QTxbzaXp5IvhGGusbqJbszbEbNYO+
 MH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SyntY4ihtgwRKYcY/fS0VkFBQ+EsKbXW8mdTDYFHVRY=;
 b=cj1XyDwrzFVMxuXU8u1PiE3UvpE1Ugh8FyVG9W6ATEH/HzINTls08XGAshs9oH9/Q5
 ity0tWxqFq8941/zSpSZv19KKns4TJrYs9xQhvkNaVrIsSJkqPPNh0V6Og+Nefs3k+a6
 /ephgJDJcLWRYTdIVtBDZkgXBrySz7+8IT5ggKZD0NTeVuVv74QzV7dFiLoRsjl2oCCA
 PGh+5V6JvdZr9DA945UMKztBJiKh4t8I5/YxZHQyPNy95CcN+GAd5s0g9kHnixcN9GeC
 US5cuWpJRUyt9unfH9x8Lsp+T0mpg/CJn/vYl0nZHA8Lj3rLj6XYFQDfqBWCjfq6c7Db
 2/Dg==
X-Gm-Message-State: AGi0PuYSBSc/BlW+ISqsnN8Oc7x724VNqyRPUV4raJ1OZQE/l9oT9Kh+
 kk+yoUkinW1a3fKGBSatj+ehTwT/jXrTFK8DlzB64g==
X-Google-Smtp-Source: APiQypJTlzDaEDtPbrHT6c3dPUnTRa2WqGnDESm8sW7oyUka/0bnqAldjdZfM2B5z9ASrfNekd5cCddE2z21ojYztrU=
X-Received: by 2002:a2e:9dcd:: with SMTP id x13mr2971981ljj.120.1587666144250; 
 Thu, 23 Apr 2020 11:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com> <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <20200417120226.0cd6bc21@eldfell.localdomain> <87k12e2uoa.fsf@intel.com>
 <e8da46f8-ebe4-aee4-31c8-229d06fa7430@redhat.com>
 <20200421174613.139991ed@eldfell.localdomain>
In-Reply-To: <20200421174613.139991ed@eldfell.localdomain>
From: Rajat Jain <rajatja@google.com>
Date: Thu, 23 Apr 2020 11:21:47 -0700
Message-ID: <CACK8Z6Hwg132K3TwsX6Bjx-2KG0HywrP=PnMMegdp7jqeU__1A@mail.gmail.com>
Subject: Re: RFC: Drm-connector properties managed by another driver / privacy
 screen support
To: Pekka Paalanen <ppaalanen@gmail.com>
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
Cc: David Airlie <airlied@linux.ie>, Christian Kellner <ckellner@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Nitin Joshi1 <njoshi1@lenovo.com>, Mark Pearson <mpearson@lenovo.com>,
 Benjamin Berg <bberg@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 21, 2020 at 7:46 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Tue, 21 Apr 2020 14:37:41 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:
>
> > TL;DR: Yes there will be races, because of both userspace +
> > the firmware having; and potentially using r/w access to
> > the privacy-screen state. But in practice I expect these
> > to not really be an issue. Important here is that userspace
> > only commits the property in a transaction to commit if
> > it actually intends to change the property so as to not
> > needlessly create a situation where we might hit the race.
> >
> > As for 1 vs 2 properties for this I guess that in preparation
> > for potential devices where the state is locked, having a
> > r/w sw-state + a ro hw-state property makes sense.
> >
> > So I suggest that we replace the current "privacy-screen" property
> > from Rajat's patch-set with 2 props named:
> >
> > "privacy-screen-sw-state" (r/w)
> > "privacy-screen-hw-state" (ro)
> >
> > Where for current gen hardware the privacy-screen-hw-state is
> > just a mirror of the sw-state.

Just to make sure I understand the semantics correctly:

- The  "privacy-screen-hw-state" shall be read-only, and can be modified by:
      - Hardware (e.g. HW kill switch).
      - Firmware.
      - (Potentially) needs a notification/irq to the kernel when this
changes (or may be kernel can read it only when userspace queries for
it).

- The "privacy-screen-sw-state" shall be read-write, and can only be
modified by user space.
        - If user space toggles it, the kernel will attempt to
"request" the change to hardware.
        - Whether the request to hardware was successful or not, the
"privacy-screen-sw-state" will always reflect the latest value
userspace wrote.
        - If the request to hardware was successful, the
"privacy-screen-hw-state" will also change (probably via a separate
notification/irq from HW).
        - We expect the user space to write to
"privacy-screen-sw-state" only if it really wants to toggle the value.

What is not clear to me is if any change to"privacy-screen-hw-state"
shall be propagated to "privacy-screen-sw-state"?
 - If yes, then I think we are not solving any problems of single property.
 - If no, then why do we require userspace to write to sw state only
if something has changed?

Also, it seems to me that in my current patchset, the property I have
already behaves like "privacy-screen-sw-state". Do I just need to
rename it?

Thanks,

Rajat

>
> Hi,
>
> this sounds like a good plan to me, assuming the kernel writes only to
> the ro property and never to the r/w property.
>
> I understand that as long as firmware hotkeys will toggle actual state,
> there is no design that could work reliably if userspace will always
> commit all KMS state even when it is not necessary. But not committing
> KMS state unless it is actually necessary is really For implementing the "privacy-screen-sw-state".a new requirement on
> userspace, so that needs to be documented before it's too late.
>
> It's not enough to document "don't set it unless you want to
> overwrite/change it" for privacy screen properties. It needs to be
> documented as a general rule that userspace must follow with *unknown*
> properties as well. "Do not restore unrecognized properties unless the
> kernel KMS state might be incorrect compared to what you used to have."
>
> This means that with a display server that does not understand privacy
> screen properties, the end user will lose the privacy screen state on
> every VT-switch back to the display server.
>
> However, if we had a way to query the kernel for the default state to
> reset unknown properties to, the kernel implementation could return the
> current value of the privacy screen property instead of "off" to not
> lose the firmware state. Assuming firmware hotkeys exist, but if they
> don't then return just "off". The point is that the kernel who knows
> all the properties makes the decision what a sane reset value is.
> Userspace can always override the reset value for the properties
> it recognizes.
>
>
> Thanks,For implementing the "privacy-screen-sw-state".
> pq
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
