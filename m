Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FA41DA5D0
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 01:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC02F6E02A;
	Tue, 19 May 2020 23:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFC46E02A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 23:51:48 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id 14so628352uaq.11
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 16:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AbBbXi191LrYg/ml05xDsQ+3qEPFSdSx8s8UefUBfGg=;
 b=NJ3oluJVqYWRsI3bBRaS9O/RBwSCkKjBXTemhz+vDuDJg5fxyz3HNUzvXOVVX41gV4
 4EQVRgtT4rn5/WctvESGbCFjkJDKePgFxvZAwXtmAvx2HtfV+vcdFtyp7itqmAPfSGpS
 39JXAe6SDWDe2pzlBdM9yHObnnlMiT2YfzjM/9bdADf95fPqeKNq70oyJ0LHi+mkJlV3
 TaZCCsqgSC0y3//rifX6KvMG40Ll29rOD+wehTuLx/AZtzFuCSBOD+G29kJ8NNo5ELFN
 yVkTFf9t9dtrWwAa9tp3Nm0k/lqkpx9QOssFjiFzMtsQpmpRwImIJhJqHIP5p9/JfSzt
 xO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AbBbXi191LrYg/ml05xDsQ+3qEPFSdSx8s8UefUBfGg=;
 b=oedvbNMAt4UvpRQg69ZWmKG5BCwlY5VqLxgKzXp4WqbOw6xhVsHc5zbcKXMxIvDnQ1
 y4oZegORt+Jj3OCz8d11BRrgxnLxJP3tb7Gahp7B2O7rzKC4zW4ApOzkpUnvoaYS3kSz
 X1cx3oWOOvrV/V0KtWmuTAYhlOXIa2IRp8LiJoNmcaXw4nT88dnbtOH0nbif1khKaSmf
 0DhkpoJhZa8sF4u43YmEQkOZnm61WfN0xT2suXDGTqBS7k/MdHIWBl2mlSIq7EhwDHdg
 YBRQP/EZug51MCCdoyCqrnAUxfOop7s4j8Gy9Q5l2iYoLjjtJljqXKXGgyPa1U3Z4y/W
 Q0Gw==
X-Gm-Message-State: AOAM5332ovb3hpbSJIVB2BUUxrGdlVUEQpOaztSxIMVb61Br6ENUqXvN
 QuwLMwwB375hMzOwGCU0nwMtjdAtEgw003z6ilTYzh+Q
X-Google-Smtp-Source: ABdhPJxjixBB33o5SiRzCNlzB52zeIqiW9hgZqcUn2/k1xwc8NOTojJWw6InmANDAoNqHy9h7ZrIAkBdngzCI9xQX1g=
X-Received: by 2002:a9f:2188:: with SMTP id 8mr1799661uac.46.1589932307040;
 Tue, 19 May 2020 16:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589468282.git.rohan.garg@collabora.com>
 <a0806974b5c0203ed824500dc2e780eb7af02837.1589468282.git.rohan.garg@collabora.com>
In-Reply-To: <a0806974b5c0203ed824500dc2e780eb7af02837.1589468282.git.rohan.garg@collabora.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 20 May 2020 00:48:53 +0100
Message-ID: <CACvgo52mso5kEWtjBQKM9RF51P=KnERRoWGai-emo2ofzJWLXA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] drm/ioctl: Add a ioctl to set and get a label on
 GEM objects
To: Rohan Garg <rohan.garg@collabora.com>
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
Cc: kernel@collabora.com, ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rohan,

As a high-level question: how does this compare to VC4_LABEL_BO?
Is it possible to implement to replace or partially implement the vc4
one with this infra?

IMHO this is something to aim for.

A handful of ideas and suggestions below:

On Thu, 14 May 2020 at 16:05, Rohan Garg <rohan.garg@collabora.com> wrote:

> Signed-off-by: Rohan Garg <rohan.garg@collabora.com>
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
New functionality usually has suggested-by tags. Reported-by tags are
used when the feature isn't behaving as expected.

> +int drm_gem_set_label(struct drm_device *dev,
> +                      struct drm_file *file_priv,
> +                          uint32_t handle,
> +                          const char *label)
Nit: re-wrap to use more of the 80 (ish) columns (applies for the whole patch)

> +{
> +       struct drm_gem_object *gem_obj;
> +       int ret = 0;
> +
> +       gem_obj = drm_gem_object_lookup(file_priv, handle);
> +       if (!gem_obj) {
> +               DRM_DEBUG("Failed to look up GEM BO %d\n", handle);
> +               ret = -ENOENT;
> +               goto out;
> +       }
> +       drm_gem_adopt_label(gem_obj, label);
> +
> +out:
> +       drm_gem_object_put_unlocked(gem_obj);
I've just renamed this - s/_unlocked//g (applies for the whole patch)

> +       return ret;
> +}
> +EXPORT_SYMBOL(drm_gem_set_label);
> +
> +void drm_gem_adopt_label(struct drm_gem_object *gem_obj, const char *label)
> +{
> +       char *adopted_label = NULL;
> +
> +       if (label)
> +               adopted_label = kstrdup(label, GFP_KERNEL);
Hmm the caller already creates a copy. Why do we create yet another one?
Personally I would drop this one + the free in the caller.

> +
> +       kfree(gem_obj->label);
> +
> +       gem_obj->label = adopted_label;
Do we have any protection of ->label wrt concurrent access? Say two
writers, attempting to both set the label.

> +}
> +EXPORT_SYMBOL(drm_gem_adopt_label);
> +
> +char *drm_gem_get_label(struct drm_device *dev,
> +                      struct drm_file *file_priv,
> +                          uint32_t handle)
> +{
> +       struct drm_gem_object *gem_obj;
> +
> +       gem_obj = drm_gem_object_lookup(file_priv, handle);
> +       if (!gem_obj) {
> +               DRM_DEBUG("Failed to look up GEM BO %d\n", handle);
> +               return NULL;
> +       }
> +
> +       return gem_obj->label;
Missing drm_gem_object_put? I suggest writing a few IGT tests, to flex
the issues raised.

> +}
> +EXPORT_SYMBOL(drm_gem_get_label);
> +


> +/**
> + * drm_handle_set_label_ioctl - Assign a string label with a handle
Nit: s/with a/to a/ reads better IMHO.

> + * @data: user argument
> + * @file_priv: drm file-private structure
> + *
> + * This ioctl can be used by whoever decides the purpose of a buffer to
> + * label the buffer object associated with the handle.
> + *
I'd drop the "whoever" section, leaving only the user-space part.

> + * This is typically targeted at user space drivers to label buffer objects
> + * with relevant information to provide human readable information about the
> + * contents of a buffer (for eg: a UBO, command buffer, shader, etc).
> + *
> + * Label length *must* not be larger than PAGE_SIZE.
> + *
> + * Returns:
> + * 0 if setting a label succeeded, negative errno otherwise.
> + */
> +
> +int drm_handle_set_label_ioctl(struct drm_device *dev,
This and the getter could be static functions. They're used only
within this file.

> +                               void *data, struct drm_file *file_priv)
> +{
> +       char *label;
> +       struct drm_handle_label *args = data;
> +       int ret = 0;
Nit: there's no need to initialize ret.

> +
> +       if (!dev->driver->set_label || args->len > PAGE_SIZE)
AFAICT the PAGE_SIZE check should be a EINVAL.

Additionally, It would be better, to use the default implementation
when the function pointer is not explicitly set.
That should allow for more consistent and easier use.

Think about the time gap (esp. for some distributions) between the
kernel feature landing and being generally accessible to userspace.

> +               return -EOPNOTSUPP;
> +
> +       if (!args->len)
> +               label = NULL;
> +       else if (args->len && args->label)
> +               label = strndup_user(u64_to_user_ptr(args->label), args->len);
> +       else
Might be worth throwing EINVAL for !len && label... or perhaps not. In
either case please document it.

> +               return -EINVAL;
> +
> +       if (IS_ERR(label)) {
> +               ret = PTR_ERR(label);
> +               return ret;
> +       }
> +
> +       ret = dev->driver->set_label(dev, file_priv, args->handle, label);
> +
> +       kfree(label);
> +       return ret;
> +}
> +

Missing documentation?
> +int drm_handle_get_label_ioctl(struct drm_device *dev,
> +                               void *data, struct drm_file *file_priv)
> +{
> +       struct drm_handle_label *args = data;
> +       int ret = 0;
Nit: drop the initialization

> +       char *label;
> +
> +       if (!dev->driver->get_label)
> +               return -EOPNOTSUPP;
Same logic as the setter applies.

> +
> +       label = dev->driver->get_label(dev, file_priv, args->handle);
> +       args->len = strlen(label) + 1;
> +
> +       if (!label)
> +               return -EFAULT;
The label is explicitly cleared or empty, why is this an error?
A more indicative feedback is to return success with len being zero.

> +
> +       if (args->label)
> +               ret = copy_to_user(u64_to_user_ptr(args->label),
> +                                  label,
> +                                  args->len);
> +
Consider the following - userspace allocates less memory than needed
for the whole string.
Be that size concerns or simply because it's interested only in the
first X bytes.

If we're interested in supporting that, a simple min(args->len, len)
could be used.

> +       return ret;
> +}


> +       /**
> +        * @set_label:
> +        *
> +        * This label's a buffer object.
EPARSE


> +       /**
> +        * @get_label:
> +        *
> +        * This reads's the label of a buffer object.
Nit: This reads the label of a buffer object.


> +struct drm_handle_label {
> +       /** Handle for the object being labelled. */
> +       __u32 handle;
> +
> +       /** Label and label length (len includes the trailing NUL). */
Nit: NULL + mention the PAGE_SIZE limitation.

> +       __u32 len;
> +       __u64 label;
> +
> +       /** Flags */
> +       int flags;
s/int/__u32/ + comment, currently no flags are defined.


> +#define DRM_IOCTL_HANDLE_SET_LABEL      DRM_IOWR(0xCF, struct drm_handle_label)
Pretty sure that WR is wrong here, although I don't recall we should
be using read or write only.
Unfortunately many drivers/ioctls get this wrong :-\

HTH
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
