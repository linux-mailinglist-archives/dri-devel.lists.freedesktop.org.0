Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D77B929B7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 20:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB59F10E1AF;
	Mon, 22 Sep 2025 18:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="RTmcpv05";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B61A10E1AF
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 18:35:55 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-45b4d89217aso36541155e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 11:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1758566154; x=1759170954; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c6UAHdzkeGUZDPaTwkVRcV6r4of16oT1H6Rp/I4eYj8=;
 b=RTmcpv059vGsWdUrtK3PJyZiIJUESYjQ5AlDOPAa52BCzInjAaz3AkOlMRlWZ2Cus3
 GSeg1TcneE3G6L/cDKoeeHMDQjs2DVExs5+yjySh/ML0zugJVTAWYEIfWN5M+X4rVaia
 N7qWi1QusllhIhhH20GhCCKeY60wd9gVwtp38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758566154; x=1759170954;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c6UAHdzkeGUZDPaTwkVRcV6r4of16oT1H6Rp/I4eYj8=;
 b=lPkq1pQdWx5R5yganUhj5dVyLvRFojlH7hhMJC+sbH2HX5TAvA4UE4k4LxuJloty5P
 LpE71vcRbCRVxuK1zJTK2d6/qCd8TBGORCHSNS0xu/r0BLsUW2clBtdLtDLeH2jn7eBI
 PBVMHHBkimdDthBS/L/IN6QJi47moQEJVPqx3tH7PBLUh8idoNo3VsVr6e57peQ6a6Jj
 +GCwhgpmZpavazfpcq6Jgygi0uMmgHfUTeoo3C06LCJr5bCJn63z3IgB5U0XLIhNT8PV
 /oQUjqB33Lj8XwnrWDnklTQoc8NBl9kGRRB6NitrrE4n4ICj4t6ZMer+0hxxU+V07mG7
 bbuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkElPRiFIgC3H6wz4mI+EBgwfIJk2gzneBKoHUnFctDIxYdMWgaDTp1qZNCVXCYdrNS7i2ak554wM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaWUzxk1OsL7S8xdH+iQhR6Ba6Vc9aMlHGNTxiFhCVx+fUUNa/
 0xKhEjQBSOw1AHFX5kHntmqN/WcxphsI+3rfhNYqoOgF7kU3vFwZ/4gcbTf5CD6XKlg=
X-Gm-Gg: ASbGncuyQDw50Naqi34e8Cj8H+YZRWOQdNJEcYPr8llL/959KpjEAiFmuVHJsPxwu0O
 wVC/CuAAhScdyRjVfyJv6PGEjU3IU5gsEnwmezFPPDqoW7xAg+zAUHdbOlzo7OZN+EnvwSaPSdz
 zkkSAM99aIDTb13+fI86VwfF+J052dzTmH/sWrA0yVu5/42G7myhBxQ4h68d/TXcDMuPYXfHQg1
 qu9yFfGGIOIehGG/q+yQSsiwM2ddGmxjkELdkiocA4O8xpMZlanPxXsP5DpbLyNJtOo16t2HKE4
 GdzcI8CVx11eXoB3omxNXzWiCO8DN27jZ8gxSA24qKKu+SLl2CYOOQt0E69H3x3KIylK7r986eK
 Xld9vWK8seZ8hin3L38zkCU0tRly6M2+cyQ==
X-Google-Smtp-Source: AGHT+IHoWYpJTX0Dwdcy2j28SC1Fkd6TdhVpZUqck7jqY5utPIH/87uIknKkkCXyEhK1zToTSBxcQA==
X-Received: by 2002:a05:600c:3541:b0:456:19eb:2e09 with SMTP id
 5b1f17b1804b1-467ebe9d9b4mr142463615e9.8.1758566154006; 
 Mon, 22 Sep 2025 11:35:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-401d7fa1729sm2884274f8f.5.2025.09.22.11.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:35:52 -0700 (PDT)
Date: Mon, 22 Sep 2025 20:35:50 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
 Dawid Niedzwiecki <dawidn@google.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kselftest@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/5] revocable: Revocable resource management
Message-ID: <aNGXBl75utI2d37D@phenom.ffwll.local>
Mail-Followup-To: Tzung-Bi Shih <tzungbi@kernel.org>,
 Benson Leung <bleung@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
 Dawid Niedzwiecki <dawidn@google.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kselftest@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20250912081718.3827390-1-tzungbi@kernel.org>
 <20250912081718.3827390-2-tzungbi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912081718.3827390-2-tzungbi@kernel.org>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
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

On Fri, Sep 12, 2025 at 08:17:13AM +0000, Tzung-Bi Shih wrote:
> Some resources can be removed asynchronously, for example, resources
> provided by a hot-pluggable device like USB.  When holding a reference
> to such a resource, it's possible for the resource to be removed and
> its memory freed, leading to use-after-free errors on subsequent access.
> 
> Introduce the revocable to establish weak references to such resources.
> It allows a resource consumer to safely attempt to access a resource
> that might be freed at any time by the resource provider.
> 
> The implementation uses a provider/consumer model built on Sleepable
> RCU (SRCU) to guarantee safe memory access:
> 
>  - A resource provider allocates a struct revocable_provider and
>    initializes it with a pointer to the resource.
> 
>  - A resource consumer that wants to access the resource allocates a
>    struct revocable which holds a reference to the provider.
> 
>  - To access the resource, the consumer uses revocable_try_access().
>    This function enters an SRCU read-side critical section and returns
>    the pointer to the resource.  If the provider has already freed the
>    resource, it returns NULL.  After use, the consumer calls
>    revocable_release() to exit the SRCU critical section.  The
>    REVOCABLE() is a convenient helper for doing that.
> 
>  - When the provider needs to remove the resource, it calls
>    revocable_provider_free().  This function sets the internal resource
>    pointer to NULL and then calls synchronize_srcu() to wait for all
>    current readers to finish before the resource can be completely torn
>    down.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Want. Want. Want.

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

SRCU isn't the greatest choice in theory, which is why Rust uses plain
RCU. But with C's real-world track record at getting error paths right,
it's imo the pragmatic choice since it allows you to cheat a bit and cut
some corners. Rust is flat out just massively better at this, despite
linux/cleanup.h and all the other improvements we've landed over the
years.

Since DRM uses the same concept in drm_dev_enter() and drm_dev_exit() it
would be really neat to have a patch that switches these over internally
to use revocable resources. That way drivers could use REVOCEABLE() and we
could slowly convert away from that DRM-ism.

Cheers, Sima

> ---
> v3:
> - No changes.
> 
> v2: https://lore.kernel.org/chrome-platform/20250820081645.847919-2-tzungbi@kernel.org
> - Rename "ref_proxy" -> "revocable".
> - Add introduction in kernel-doc format in revocable.c.
> - Add MAINTAINERS entry.
> - Add copyright.
> - Move from lib/ to drivers/base/.
> - EXPORT_SYMBOL() -> EXPORT_SYMBOL_GPL().
> - Add Documentation/.
> - Rename _get() -> try_access(); _put() -> release().
> - Fix a sparse warning by removing the redundant __rcu annotations.
> - Fix a sparse warning by adding __acquires() and __releases() annotations.
> 
> v1: https://lore.kernel.org/chrome-platform/20250814091020.1302888-2-tzungbi@kernel.org
> 
>  .../driver-api/driver-model/index.rst         |   1 +
>  .../driver-api/driver-model/revocable.rst     | 151 ++++++++++++
>  MAINTAINERS                                   |   7 +
>  drivers/base/Makefile                         |   2 +-
>  drivers/base/revocable.c                      | 229 ++++++++++++++++++
>  include/linux/revocable.h                     |  37 +++
>  6 files changed, 426 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/driver-api/driver-model/revocable.rst
>  create mode 100644 drivers/base/revocable.c
>  create mode 100644 include/linux/revocable.h
> 
> diff --git a/Documentation/driver-api/driver-model/index.rst b/Documentation/driver-api/driver-model/index.rst
> index 4831bdd92e5c..8e1ee21185df 100644
> --- a/Documentation/driver-api/driver-model/index.rst
> +++ b/Documentation/driver-api/driver-model/index.rst
> @@ -14,6 +14,7 @@ Driver Model
>     overview
>     platform
>     porting
> +   revocable
>  
>  .. only::  subproject and html
>  
> diff --git a/Documentation/driver-api/driver-model/revocable.rst b/Documentation/driver-api/driver-model/revocable.rst
> new file mode 100644
> index 000000000000..b9e2968ba9c1
> --- /dev/null
> +++ b/Documentation/driver-api/driver-model/revocable.rst
> @@ -0,0 +1,151 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +==============================
> +Revocable Resource Management
> +==============================
> +
> +Overview
> +========
> +
> +In a system with hot-pluggable devices, such as USB, resources provided by
> +these devices can be removed asynchronously.  If a consumer holds a reference
> +to such a resource, the resource might be deallocated while the reference is
> +still held, leading to use-after-free errors upon subsequent access.
> +
> +The "revocable" mechanism addresses this by establishing a weak reference to a
> +resource that might be freed at any time.  It allows a resource consumer to
> +safely attempt to access the resource, guaranteeing that the access is valid
> +for the duration of its use, or it fails safely if the resource has already
> +been revoked.
> +
> +The implementation is based on a provider/consumer model that uses Sleepable
> +RCU (SRCU) to ensure safe memory access without traditional locking.
> +
> +How It Works
> +============
> +
> +1.  **Provider**: A resource provider, such as a driver for a hot-pluggable
> +    device, allocates a ``struct revocable_provider``.  This structure is
> +    initialized with a pointer to the actual resource it manages.
> +
> +2.  **Consumer**: A consumer that needs to access the resource is given a
> +    ``struct revocable``, which acts as a handle containing a reference to
> +    the provider.
> +
> +3.  **Accessing the Resource**: To access the resource, the consumer uses
> +    ``revocable_try_access()``.  This function enters an SRCU read-side
> +    critical section and returns a pointer to the resource.  If the provider
> +    has already revoked the resource, this function returns ``NULL``.  The
> +    consumer must check for this ``NULL`` return.
> +
> +4.  **Releasing the Resource**: After the consumer has finished using the
> +    resource, it must call ``revocable_release()`` to exit the SRCU critical
> +    section.  This signals that the consumer no longer requires access.  The
> +    ``REVOCABLE()`` macro is provided as a convenient and safe way to manage
> +    the access-release cycle.
> +
> +5.  **Revoking the Resource**: When the provider needs to remove the resource
> +    (e.g., the device is unplugged), it calls ``revocable_provider_free()``.
> +    This function first sets the internal resource pointer to ``NULL``,
> +    preventing any new consumers from accessing it.  It then calls
> +    ``synchronize_srcu()``, which waits for all existing consumers currently
> +    in the SRCU critical section to finish their work.  Once all consumers
> +    have released their access, the resource can be safely deallocated.
> +
> +Revocable vs. Device-Managed (devm) Resources
> +=============================================
> +
> +It's important to understand the distinction between a standard
> +device-managed (devm) resource and a resource managed by a
> +``revocable_provider``.
> +
> +The key difference is their lifetime:
> +
> +*   A **devm resource** is tied to the lifetime of the device.  It is
> +    automatically freed when the device is unbound.
> +*   A **revocable_provider** persists as long as there are active references
> +    to it from ``revocable`` consumer handles.
> +
> +This means that a ``revocable_provider`` can outlive the device that created
> +it.  This is a deliberate design feature, allowing consumers to hold a
> +reference to a resource even after the underlying device has been removed,
> +without causing a fault.  When the consumer attempts to access the resource,
> +it will simply be informed that the resource is no longer available.
> +
> +API and Usage
> +=============
> +
> +For Resource Providers
> +----------------------
> +
> +``struct revocable_provider *revocable_provider_alloc(void *res);``
> +    Allocates a provider handle for the given resource ``res``.  It returns a
> +    pointer to the ``revocable_provider`` on success, or ``NULL`` on failure.
> +
> +``struct revocable_provider *devm_revocable_provider_alloc(struct device *dev, void *res);``
> +    A device-managed version of ``revocable_provider_alloc``.  It is
> +    convenient to allocate providers via this function if the ``res`` is also
> +    tied to the lifetime of the ``dev``.  ``revocable_provider_free`` will be
> +    called automatically when the device is unbound.
> +
> +``void revocable_provider_free(struct revocable_provider *rp);``
> +    Revokes the resource.  This function marks the resource as unavailable and
> +    waits for all current consumers to finish before the underlying memory
> +    can be freed.
> +
> +For Resource Consumers
> +----------------------
> +
> +``struct revocable *revocable_alloc(struct revocable_provider *rp);``
> +    Allocates a consumer handle for a given provider ``rp``.
> +
> +``void revocable_free(struct revocable *rev);``
> +    Frees a consumer handle.
> +
> +``void *revocable_try_access(struct revocable *rev);``
> +    Attempts to gain access to the resource.  Returns a pointer to the
> +    resource on success or ``NULL`` if it has been revoked.
> +
> +``void revocable_release(struct revocable *rev);``
> +    Releases access to the resource, exiting the SRCU critical section.
> +
> +The ``REVOCABLE()`` Macro
> +=========================
> +
> +The ``REVOCABLE()`` macro simplifies the access-release cycle for consumers,
> +ensuring that ``revocable_release()`` is always called, even in the case of
> +an early exit.
> +
> +``REVOCABLE(rev, res)``
> +    *   ``rev``: The consumer's ``struct revocable *`` handle.
> +    *   ``res``: A pointer variable that will be assigned the resource.
> +
> +The macro creates a ``for`` loop that executes exactly once.  Inside the loop,
> +``res`` is populated with the result of ``revocable_try_access()``.  The
> +consumer code **must** check if ``res`` is ``NULL`` before using it.  The
> +``revocable_release()`` function is automatically called when the scope of
> +the loop is exited.
> +
> +Example Usage
> +-------------
> +
> +.. code-block:: c
> +
> +    void consumer_use_resource(struct revocable *rev)
> +    {
> +        struct foo_resource *res;
> +
> +        REVOCABLE(rev, res) {
> +            // Always check if the resource is valid.
> +            if (!res) {
> +                pr_warn("Resource is not available\n");
> +                return;
> +            }
> +
> +            // At this point, 'res' is guaranteed to be valid until
> +            // this block exits.
> +            do_something_with(res);
> +        }
> +
> +        // revocable_release() is automatically called here.
> +    }
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fa7f80bd7b2f..5d11aeeb546e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21877,6 +21877,13 @@ F:	include/uapi/linux/rseq.h
>  F:	kernel/rseq.c
>  F:	tools/testing/selftests/rseq/
>  
> +REVOCABLE RESOURCE MANAGEMENT
> +M:	Tzung-Bi Shih <tzungbi@kernel.org>
> +L:	linux-kernel@vger.kernel.org
> +S:	Maintained
> +F:	drivers/base/revocable.c
> +F:	include/linux/revocable.h
> +
>  RFKILL
>  M:	Johannes Berg <johannes@sipsolutions.net>
>  L:	linux-wireless@vger.kernel.org
> diff --git a/drivers/base/Makefile b/drivers/base/Makefile
> index 8074a10183dc..bdf854694e39 100644
> --- a/drivers/base/Makefile
> +++ b/drivers/base/Makefile
> @@ -6,7 +6,7 @@ obj-y			:= component.o core.o bus.o dd.o syscore.o \
>  			   cpu.o firmware.o init.o map.o devres.o \
>  			   attribute_container.o transport_class.o \
>  			   topology.o container.o property.o cacheinfo.o \
> -			   swnode.o faux.o
> +			   swnode.o faux.o revocable.o
>  obj-$(CONFIG_AUXILIARY_BUS) += auxiliary.o
>  obj-$(CONFIG_DEVTMPFS)	+= devtmpfs.o
>  obj-y			+= power/
> diff --git a/drivers/base/revocable.c b/drivers/base/revocable.c
> new file mode 100644
> index 000000000000..80a48896b241
> --- /dev/null
> +++ b/drivers/base/revocable.c
> @@ -0,0 +1,229 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 Google LLC
> + *
> + * Revocable resource management
> + */
> +
> +#include <linux/device.h>
> +#include <linux/kref.h>
> +#include <linux/revocable.h>
> +#include <linux/slab.h>
> +#include <linux/srcu.h>
> +
> +/**
> + * DOC: Overview
> + *
> + * Some resources can be removed asynchronously, for example, resources
> + * provided by a hot-pluggable device like USB.  When holding a reference
> + * to such a resource, it's possible for the resource to be removed and
> + * its memory freed, leading to use-after-free errors on subsequent access.
> + *
> + * Introduce the revocable to establish weak references to such resources.
> + * It allows a resource consumer to safely attempt to access a resource
> + * that might be freed at any time by the resource provider.
> + *
> + * The implementation uses a provider/consumer model built on Sleepable
> + * RCU (SRCU) to guarantee safe memory access:
> + *
> + * - A resource provider allocates a struct revocable_provider and
> + *   initializes it with a pointer to the resource.
> + *
> + * - A resource consumer that wants to access the resource allocates a
> + *   struct revocable which holds a reference to the provider.
> + *
> + * - To access the resource, the consumer uses revocable_try_access().
> + *   This function enters an SRCU read-side critical section and returns
> + *   the pointer to the resource.  If the provider has already freed the
> + *   resource, it returns NULL.  After use, the consumer calls
> + *   revocable_release() to exit the SRCU critical section.  The
> + *   REVOCABLE() is a convenient helper for doing that.
> + *
> + * - When the provider needs to remove the resource, it calls
> + *   revocable_provider_free().  This function sets the internal resource
> + *   pointer to NULL and then calls synchronize_srcu() to wait for all
> + *   current readers to finish before the resource can be completely torn
> + *   down.
> + */
> +
> +/**
> + * struct revocable_provider - A handle for resource provider.
> + * @srcu: The SRCU to protect the resource.
> + * @res:  The pointer of resource.  It can point to anything.
> + * @kref: The refcount for this handle.
> + */
> +struct revocable_provider {
> +	struct srcu_struct srcu;
> +	void __rcu *res;
> +	struct kref kref;
> +};
> +
> +/**
> + * struct revocable - A handle for resource consumer.
> + * @rp: The pointer of resource provider.
> + * @idx: The index for the RCU critical section.
> + */
> +struct revocable {
> +	struct revocable_provider *rp;
> +	int idx;
> +};
> +
> +/**
> + * revocable_provider_alloc() - Allocate struct revocable_provider.
> + * @res: The pointer of resource.
> + *
> + * This holds an initial refcount to the struct.
> + *
> + * Return: The pointer of struct revocable_provider.  NULL on errors.
> + */
> +struct revocable_provider *revocable_provider_alloc(void *res)
> +{
> +	struct revocable_provider *rp;
> +
> +	rp = kzalloc(sizeof(*rp), GFP_KERNEL);
> +	if (!rp)
> +		return NULL;
> +
> +	init_srcu_struct(&rp->srcu);
> +	rcu_assign_pointer(rp->res, res);
> +	synchronize_srcu(&rp->srcu);
> +	kref_init(&rp->kref);
> +
> +	return rp;
> +}
> +EXPORT_SYMBOL_GPL(revocable_provider_alloc);
> +
> +static void revocable_provider_release(struct kref *kref)
> +{
> +	struct revocable_provider *rp = container_of(kref,
> +			struct revocable_provider, kref);
> +
> +	cleanup_srcu_struct(&rp->srcu);
> +	kfree(rp);
> +}
> +
> +/**
> + * revocable_provider_free() - Free struct revocable_provider.
> + * @rp: The pointer of resource provider.
> + *
> + * This sets the resource `(struct revocable_provider *)->res` to NULL to
> + * indicate the resource has gone.
> + *
> + * This drops the refcount to the resource provider.  If it is the final
> + * reference, revocable_provider_release() will be called to free the struct.
> + */
> +void revocable_provider_free(struct revocable_provider *rp)
> +{
> +	rcu_assign_pointer(rp->res, NULL);
> +	synchronize_srcu(&rp->srcu);
> +	kref_put(&rp->kref, revocable_provider_release);
> +}
> +EXPORT_SYMBOL_GPL(revocable_provider_free);
> +
> +static void devm_revocable_provider_free(void *data)
> +{
> +	struct revocable_provider *rp = data;
> +
> +	revocable_provider_free(rp);
> +}
> +
> +/**
> + * devm_revocable_provider_alloc() - Dev-managed revocable_provider_alloc().
> + * @dev: The device.
> + * @res: The pointer of resource.
> + *
> + * It is convenient to allocate providers via this function if the @res is
> + * also tied to the lifetime of the @dev.  revocable_provider_free() will
> + * be called automatically when the device is unbound.
> + *
> + * This holds an initial refcount to the struct.
> + *
> + * Return: The pointer of struct revocable_provider.  NULL on errors.
> + */
> +struct revocable_provider *devm_revocable_provider_alloc(struct device *dev,
> +							 void *res)
> +{
> +	struct revocable_provider *rp;
> +
> +	rp = revocable_provider_alloc(res);
> +	if (!rp)
> +		return NULL;
> +
> +	if (devm_add_action_or_reset(dev, devm_revocable_provider_free, rp))
> +		return NULL;
> +
> +	return rp;
> +}
> +EXPORT_SYMBOL_GPL(devm_revocable_provider_alloc);
> +
> +/**
> + * revocable_alloc() - Allocate struct revocable_provider.
> + * @rp: The pointer of resource provider.
> + *
> + * This holds a refcount to the resource provider.
> + *
> + * Return: The pointer of struct revocable_provider.  NULL on errors.
> + */
> +struct revocable *revocable_alloc(struct revocable_provider *rp)
> +{
> +	struct revocable *rev;
> +
> +	rev = kzalloc(sizeof(*rev), GFP_KERNEL);
> +	if (!rev)
> +		return NULL;
> +
> +	rev->rp = rp;
> +	kref_get(&rp->kref);
> +
> +	return rev;
> +}
> +EXPORT_SYMBOL_GPL(revocable_alloc);
> +
> +/**
> + * revocable_free() - Free struct revocable.
> + * @rev: The pointer of struct revocable.
> + *
> + * This drops a refcount to the resource provider.  If it is the final
> + * reference, revocable_provider_release() will be called to free the struct.
> + */
> +void revocable_free(struct revocable *rev)
> +{
> +	struct revocable_provider *rp = rev->rp;
> +
> +	kref_put(&rp->kref, revocable_provider_release);
> +	kfree(rev);
> +}
> +EXPORT_SYMBOL_GPL(revocable_free);
> +
> +/**
> + * revocable_try_access() - Try to access the resource.
> + * @rev: The pointer of struct revocable.
> + *
> + * This tries to de-reference to the resource and enters a RCU critical
> + * section.
> + *
> + * Return: The pointer to the resource.  NULL if the resource has gone.
> + */
> +void *revocable_try_access(struct revocable *rev) __acquires(&rev->rp->srcu)
> +{
> +	struct revocable_provider *rp = rev->rp;
> +
> +	rev->idx = srcu_read_lock(&rp->srcu);
> +	return rcu_dereference(rp->res);
> +}
> +EXPORT_SYMBOL_GPL(revocable_try_access);
> +
> +/**
> + * revocable_release() - Stop accessing to the resource.
> + * @rev: The pointer of struct revocable.
> + *
> + * Call this function to indicate the resource is no longer used.  It exits
> + * the RCU critical section.
> + */
> +void revocable_release(struct revocable *rev) __releases(&rev->rp->srcu)
> +{
> +	struct revocable_provider *rp = rev->rp;
> +
> +	srcu_read_unlock(&rp->srcu, rev->idx);
> +}
> +EXPORT_SYMBOL_GPL(revocable_release);
> diff --git a/include/linux/revocable.h b/include/linux/revocable.h
> new file mode 100644
> index 000000000000..17d9b7ce633d
> --- /dev/null
> +++ b/include/linux/revocable.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2025 Google LLC
> + */
> +
> +#ifndef __LINUX_REVOCABLE_H
> +#define __LINUX_REVOCABLE_H
> +
> +#include <linux/cleanup.h>
> +
> +struct device;
> +struct revocable;
> +struct revocable_provider;
> +
> +struct revocable_provider *revocable_provider_alloc(void *res);
> +void revocable_provider_free(struct revocable_provider *rp);
> +struct revocable_provider *devm_revocable_provider_alloc(struct device *dev,
> +							 void *res);
> +
> +struct revocable *revocable_alloc(struct revocable_provider *rp);
> +void revocable_free(struct revocable *rev);
> +void *revocable_try_access(struct revocable *rev) __acquires(&rev->rp->srcu);
> +void revocable_release(struct revocable *rev) __releases(&rev->rp->srcu);
> +
> +DEFINE_FREE(revocable, struct revocable *, if (_T) revocable_release(_T))
> +
> +#define _REVOCABLE(_rev, _label, _res)						\
> +	for (struct revocable *__UNIQUE_ID(name) __free(revocable) = _rev;	\
> +	     (_res = revocable_try_access(_rev)) || true; ({ goto _label; }))	\
> +		if (0) {							\
> +_label:										\
> +			break;							\
> +		} else
> +
> +#define REVOCABLE(_rev, _res) _REVOCABLE(_rev, __UNIQUE_ID(label), _res)
> +
> +#endif /* __LINUX_REVOCABLE_H */
> -- 
> 2.51.0.384.g4c02a37b29-goog
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
