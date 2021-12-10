Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24EF46FFBD
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 12:22:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A836F10E1AC;
	Fri, 10 Dec 2021 11:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4593410E1AB;
 Fri, 10 Dec 2021 11:22:48 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1mvdyz-0007Cq-Hr; Fri, 10 Dec 2021 12:22:34 +0100
Message-ID: <b9523f2c-4ea3-986c-0607-deadf6481354@leemhuis.info>
Date: Fri, 10 Dec 2021 12:22:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 02/10] drm: Add privacy-screen class (v4)
Content-Language: de-DE
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rajat Jain <rajatja@google.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Lyude <lyude@redhat.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Mark Gross <markgross@kernel.org>, Andy Shevchenko <andy@infradead.org>
References: <20211005202322.700909-1-hdegoede@redhat.com>
 <20211005202322.700909-3-hdegoede@redhat.com>
 <460220bf-a34d-ba23-4624-e296e9ada6bb@leemhuis.info>
 <0d66aa18-4ad8-a117-8ec2-bc3aa676a14e@redhat.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <0d66aa18-4ad8-a117-8ec2-bc3aa676a14e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1639135368;
 2798c503; 
X-HE-SMSGID: 1mvdyz-0007Cq-Hr
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
Cc: Marco Trevisan <marco.trevisan@canonical.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Sebastien Bacher <seb128@ubuntu.com>, David Airlie <airlied@linux.ie>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Mark Pearson <markpearson@lenovo.com>,
 Mario Limonciello <mario.limonciello@outlook.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10.12.21 11:46, Hans de Goede wrote:
> On 12/10/21 11:12, Thorsten Leemhuis wrote:
>> Hi, this is your Linux kernel regression tracker speaking.
>>
>> Top-posting for once, to make this easy accessible to everyone.
>>
>> Hans, I stumbled upon your blog post about something that afaics is
>> related to below patch:
>> https://hansdegoede.livejournal.com/25948.html
>>
>> To quote:
>>
>>> To avoid any regressions distors should modify their initrd
>>> generation tools to include privacy screen provider drivers in the
>>> initrd (at least on systems with a privacy screen), before 5.17
>>> kernels start showing up in their repos.
>>>
>>> If this change is not made, then users using a graphical bootsplash
>>> (plymouth) will get an extra boot-delay of up to 8 seconds
>>> (DeviceTimeout in plymouthd.defaults) before plymouth will show and
>>> when using disk-encryption where the LUKS password is requested from
>>> the initrd, the system will fallback to text-mode after these 8
>>> seconds.
>>
>> Sorry for intruding, but to me as the kernel's regression tracker that
>> blog post sounds a whole lot like "by kernel development standards this
>> is not allowed due to the 'no regression rule', as users should never be
>> required to update something in userspace when updating the kernel".
> 
> I completely understand where you are coming from here, but AFAIK
> the initrd generation has always been a bit of an exception here.

Many thx for the clarification. Yeah, kinda, but it afaics also partly
depends on what kind of breakage users have to endure -- which according
to the description is not that bad in this case, so I guess in this case
everything is fine as it is.

Again, thx for your answer.

Ciao, Thorsten

> For example (IIRC) over time we have seen the radeon module growing
> a runtime dependency on the amdkfd module which also required updated
> initrd generation tools.
> 
> Another example (which I'm sure of) is the i915 driver gaining a softdep
> on kvmgt (which is now gone again) which required new enough kmod tools
> to understand this as well as initrd generation tools updates to also
> take softdeps into account:
> https://github.com/dracutdevs/dracut/commit/4cdee66c8ed5f82bbd0638e30d867318343b0e6c
> 
> More in general if you look at e.g. dracut's git history, there are
> various other cases where dracut needed to be updated to adjust
> to kernel changes. For example dracut decides if a module is a block
> driver and thus may be necessary to have in the initrd based on a
> list of kernel-symbols the module links to and sometimes those
> symbols change due to refactoring of kernel internals, see e.g. :
> https://github.com/dracutdevs/dracut/commit/b292ce7295f18192124e64e5ec31161d09492160
> 
> TL;DR: initrd-generators and the kernel are simply tied together so much
> that users cannot expect to be able to jump to the latest kernel without
> either updating the initrd-generator, or adding some modules as modules
> which must always be added to the initrd in the initrd-generator config
> file (as a workaround).
> 
> Declaring kernel changes which break initrd-generation in some way as
> being regressions, would mean that e.g. we cannot introduce any
> kernel changes which causes some drm/block/whatever drivers to use
> some new register helper functions which are not yet on the list of
> symbols which dracut uses to identify drm/block/whatever drivers.
> 
> The only difference between previous initrd-generator breaking changes
> and this one, is that I decided that it would be good for everyone
> to be aware of this before hand; and now I get the feeling that I'm
> being punished for warning people about this instead of just letting
> things break silently. I know you don't intend your email this way in
> any way, but still.
> 
> Also AFAIK drivers may also at some point drop support for (much) older
> firmware versions requiring installing a recent linux-firmware together
> with a new kernel.
> 
> In my reading of the rules the 'users should never be required to update
> something in userspace when updating the kernel' rule is about keeping
> people's normal programs working, IOW not breaking userspace ABI and that
> is not happening here.
> 
>> But I'm not totally sure that's the case here. Could you please clarify
>> what happens when a user doesn't update the initramfs. E.g. what happens
>> besides the mentioned delay and the text mode (which are bad already,
>> but might be a accetable compormise here -- but that's up for Linus to
>> decide)? Does everything start to work normally shortly after the kernel
>> mounted the rootfs and finally can load the missing module?
> 
> Yes everything will work normally once the rootfs gets mounted and the
> missing module gets loaded.
> 
> Regards,
> 
> Hans
> 
> 
> 
>> On 05.10.21 22:23, Hans de Goede wrote:
>>> On some new laptops the LCD panel has a builtin electronic privacy-screen.
>>> We want to export this functionality as a property on the drm connector
>>> object. But often this functionality is not exposed on the GPU but on some
>>> other (ACPI) device.
>>>
>>> This commit adds a privacy-screen class allowing the driver for these
>>> other devices to register themselves as a privacy-screen provider; and
>>> allowing the drm/kms code to get a privacy-screen provider associated
>>> with a specific GPU/connector combo.
>>>
>>> Changes in v2:
>>> - Make CONFIG_DRM_PRIVACY_SCREEN a bool which controls if the drm_privacy
>>>   code gets built as part of the main drm module rather then making it
>>>   a tristate which builds its own module.
>>> - Add a #if IS_ENABLED(CONFIG_DRM_PRIVACY_SCREEN) check to
>>>   drm_privacy_screen_consumer.h and define stubs when the check fails.
>>>   Together these 2 changes fix several dependency issues.
>>> - Remove module related code now that this is part of the main drm.ko
>>> - Use drm_class as class for the privacy-screen devices instead of
>>>   adding a separate class for this
>>>
>>> Changes in v3:
>>> - Make the static inline drm_privacy_screen_get_state() stub set sw_state
>>>   and hw_state to PRIVACY_SCREEN_DISABLED to squelch an uninitialized
>>>   variable warning when CONFIG_DRM_PRIVICAY_SCREEN is not set
>>>
>>> Changes in v4:
>>> - Make drm_privacy_screen_set_sw_state() skip calling out to the hw if
>>>   hw_state == new_sw_state
>>>
>>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>>  Documentation/gpu/drm-kms-helpers.rst     |  15 +
>>>  MAINTAINERS                               |   8 +
>>>  drivers/gpu/drm/Kconfig                   |   4 +
>>>  drivers/gpu/drm/Makefile                  |   1 +
>>>  drivers/gpu/drm/drm_drv.c                 |   4 +
>>>  drivers/gpu/drm/drm_privacy_screen.c      | 403 ++++++++++++++++++++++
>>>  include/drm/drm_privacy_screen_consumer.h |  50 +++
>>>  include/drm/drm_privacy_screen_driver.h   |  80 +++++
>>>  include/drm/drm_privacy_screen_machine.h  |  41 +++
>>>  9 files changed, 606 insertions(+)
>>>  create mode 100644 drivers/gpu/drm/drm_privacy_screen.c
>>>  create mode 100644 include/drm/drm_privacy_screen_consumer.h
>>>  create mode 100644 include/drm/drm_privacy_screen_driver.h
>>>  create mode 100644 include/drm/drm_privacy_screen_machine.h
>>>
>>> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
>>> index ec2f65b31930..5bb55ec1b9b5 100644
>>> --- a/Documentation/gpu/drm-kms-helpers.rst
>>> +++ b/Documentation/gpu/drm-kms-helpers.rst
>>> @@ -435,3 +435,18 @@ Legacy CRTC/Modeset Helper Functions Reference
>>>  
>>>  .. kernel-doc:: drivers/gpu/drm/drm_crtc_helper.c
>>>     :export:
>>> +
>>> +Privacy-screen class
>>> +====================
>>> +
>>> +.. kernel-doc:: drivers/gpu/drm/drm_privacy_screen.c
>>> +   :doc: overview
>>> +
>>> +.. kernel-doc:: include/drm/drm_privacy_screen_driver.h
>>> +   :internal:
>>> +
>>> +.. kernel-doc:: include/drm/drm_privacy_screen_machine.h
>>> +   :internal:
>>> +
>>> +.. kernel-doc:: drivers/gpu/drm/drm_privacy_screen.c
>>> +   :export:
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 28e5f0ae1009..cb94bb3b8724 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -6423,6 +6423,14 @@ F:	drivers/gpu/drm/drm_panel.c
>>>  F:	drivers/gpu/drm/panel/
>>>  F:	include/drm/drm_panel.h
>>>  
>>> +DRM PRIVACY-SCREEN CLASS
>>> +M:	Hans de Goede <hdegoede@redhat.com>
>>> +L:	dri-devel@lists.freedesktop.org
>>> +S:	Maintained
>>> +T:	git git://anongit.freedesktop.org/drm/drm-misc
>>> +F:	drivers/gpu/drm/drm_privacy_screen*
>>> +F:	include/drm/drm_privacy_screen*
>>> +
>>>  DRM TTM SUBSYSTEM
>>>  M:	Christian Koenig <christian.koenig@amd.com>
>>>  M:	Huang Rui <ray.huang@amd.com>
>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>> index 2a926d0de423..c686c08447ac 100644
>>> --- a/drivers/gpu/drm/Kconfig
>>> +++ b/drivers/gpu/drm/Kconfig
>>> @@ -481,3 +481,7 @@ config DRM_PANEL_ORIENTATION_QUIRKS
>>>  config DRM_LIB_RANDOM
>>>  	bool
>>>  	default n
>>> +
>>> +config DRM_PRIVACY_SCREEN
>>> +	bool
>>> +	default n
>>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>>> index 0dff40bb863c..788fc37096f6 100644
>>> --- a/drivers/gpu/drm/Makefile
>>> +++ b/drivers/gpu/drm/Makefile
>>> @@ -32,6 +32,7 @@ drm-$(CONFIG_OF) += drm_of.o
>>>  drm-$(CONFIG_PCI) += drm_pci.o
>>>  drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
>>>  drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
>>> +drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o
>>>  
>>>  obj-$(CONFIG_DRM_DP_AUX_BUS) += drm_dp_aux_bus.o
>>>  
>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>> index 7a5097467ba5..dc293b771c3f 100644
>>> --- a/drivers/gpu/drm/drm_drv.c
>>> +++ b/drivers/gpu/drm/drm_drv.c
>>> @@ -43,6 +43,7 @@
>>>  #include <drm/drm_managed.h>
>>>  #include <drm/drm_mode_object.h>
>>>  #include <drm/drm_print.h>
>>> +#include <drm/drm_privacy_screen_machine.h>
>>>  
>>>  #include "drm_crtc_internal.h"
>>>  #include "drm_internal.h"
>>> @@ -1029,6 +1030,7 @@ static const struct file_operations drm_stub_fops = {
>>>  
>>>  static void drm_core_exit(void)
>>>  {
>>> +	drm_privacy_screen_lookup_exit();
>>>  	unregister_chrdev(DRM_MAJOR, "drm");
>>>  	debugfs_remove(drm_debugfs_root);
>>>  	drm_sysfs_destroy();
>>> @@ -1056,6 +1058,8 @@ static int __init drm_core_init(void)
>>>  	if (ret < 0)
>>>  		goto error;
>>>  
>>> +	drm_privacy_screen_lookup_init();
>>> +
>>>  	drm_core_init_complete = true;
>>>  
>>>  	DRM_DEBUG("Initialized\n");
>>> diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/drm_privacy_screen.c
>>> new file mode 100644
>>> index 000000000000..183a6011adf0
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/drm_privacy_screen.c
>>> @@ -0,0 +1,403 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright (C) 2020 - 2021 Red Hat, Inc.
>>> + *
>>> + * Authors:
>>> + * Hans de Goede <hdegoede@redhat.com>
>>> + */
>>> +
>>> +#include <linux/device.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/list.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/slab.h>
>>> +#include <drm/drm_privacy_screen_machine.h>
>>> +#include <drm/drm_privacy_screen_consumer.h>
>>> +#include <drm/drm_privacy_screen_driver.h>
>>> +#include "drm_internal.h"
>>> +
>>> +/**
>>> + * DOC: overview
>>> + *
>>> + * This class allows non KMS drivers, from e.g. drivers/platform/x86 to
>>> + * register a privacy-screen device, which the KMS drivers can then use
>>> + * to implement the standard privacy-screen properties, see
>>> + * :ref:`Standard Connector Properties<standard_connector_properties>`.
>>> + *
>>> + * KMS drivers using a privacy-screen class device are advised to use the
>>> + * drm_connector_attach_privacy_screen_provider() and
>>> + * drm_connector_update_privacy_screen() helpers for dealing with this.
>>> + */
>>> +
>>> +#define to_drm_privacy_screen(dev) \
>>> +	container_of(dev, struct drm_privacy_screen, dev)
>>> +
>>> +static DEFINE_MUTEX(drm_privacy_screen_lookup_lock);
>>> +static LIST_HEAD(drm_privacy_screen_lookup_list);
>>> +
>>> +static DEFINE_MUTEX(drm_privacy_screen_devs_lock);
>>> +static LIST_HEAD(drm_privacy_screen_devs);
>>> +
>>> +/*** drm_privacy_screen_machine.h functions ***/
>>> +
>>> +/**
>>> + * drm_privacy_screen_lookup_add - add an entry to the static privacy-screen
>>> + *    lookup list
>>> + * @lookup: lookup list entry to add
>>> + *
>>> + * Add an entry to the static privacy-screen lookup list. Note the
>>> + * &struct list_head which is part of the &struct drm_privacy_screen_lookup
>>> + * gets added to a list owned by the privacy-screen core. So the passed in
>>> + * &struct drm_privacy_screen_lookup must not be free-ed until it is removed
>>> + * from the lookup list by calling drm_privacy_screen_lookup_remove().
>>> + */
>>> +void drm_privacy_screen_lookup_add(struct drm_privacy_screen_lookup *lookup)
>>> +{
>>> +	mutex_lock(&drm_privacy_screen_lookup_lock);
>>> +	list_add(&lookup->list, &drm_privacy_screen_lookup_list);
>>> +	mutex_unlock(&drm_privacy_screen_lookup_lock);
>>> +}
>>> +EXPORT_SYMBOL(drm_privacy_screen_lookup_add);
>>> +
>>> +/**
>>> + * drm_privacy_screen_lookup_remove - remove an entry to the static
>>> + *    privacy-screen lookup list
>>> + * @lookup: lookup list entry to remove
>>> + *
>>> + * Remove an entry previously added with drm_privacy_screen_lookup_add()
>>> + * from the static privacy-screen lookup list.
>>> + */
>>> +void drm_privacy_screen_lookup_remove(struct drm_privacy_screen_lookup *lookup)
>>> +{
>>> +	mutex_lock(&drm_privacy_screen_lookup_lock);
>>> +	list_del(&lookup->list);
>>> +	mutex_unlock(&drm_privacy_screen_lookup_lock);
>>> +}
>>> +EXPORT_SYMBOL(drm_privacy_screen_lookup_remove);
>>> +
>>> +/*** drm_privacy_screen_consumer.h functions ***/
>>> +
>>> +static struct drm_privacy_screen *drm_privacy_screen_get_by_name(
>>> +	const char *name)
>>> +{
>>> +	struct drm_privacy_screen *priv;
>>> +	struct device *dev = NULL;
>>> +
>>> +	mutex_lock(&drm_privacy_screen_devs_lock);
>>> +
>>> +	list_for_each_entry(priv, &drm_privacy_screen_devs, list) {
>>> +		if (strcmp(dev_name(&priv->dev), name) == 0) {
>>> +			dev = get_device(&priv->dev);
>>> +			break;
>>> +		}
>>> +	}
>>> +
>>> +	mutex_unlock(&drm_privacy_screen_devs_lock);
>>> +
>>> +	return dev ? to_drm_privacy_screen(dev) : NULL;
>>> +}
>>> +
>>> +/**
>>> + * drm_privacy_screen_get - get a privacy-screen provider
>>> + * @dev: consumer-device for which to get a privacy-screen provider
>>> + * @con_id: (video)connector name for which to get a privacy-screen provider
>>> + *
>>> + * Get a privacy-screen provider for a privacy-screen attached to the
>>> + * display described by the @dev and @con_id parameters.
>>> + *
>>> + * Return:
>>> + * * A pointer to a &struct drm_privacy_screen on success.
>>> + * * ERR_PTR(-ENODEV) if no matching privacy-screen is found
>>> + * * ERR_PTR(-EPROBE_DEFER) if there is a matching privacy-screen,
>>> + *                          but it has not been registered yet.
>>> + */
>>> +struct drm_privacy_screen *drm_privacy_screen_get(struct device *dev,
>>> +						  const char *con_id)
>>> +{
>>> +	const char *dev_id = dev ? dev_name(dev) : NULL;
>>> +	struct drm_privacy_screen_lookup *l;
>>> +	struct drm_privacy_screen *priv;
>>> +	const char *provider = NULL;
>>> +	int match, best = -1;
>>> +
>>> +	/*
>>> +	 * For now we only support using a static lookup table, which is
>>> +	 * populated by the drm_privacy_screen_arch_init() call. This should
>>> +	 * be extended with device-tree / fw_node lookup when support is added
>>> +	 * for device-tree using hardware with a privacy-screen.
>>> +	 *
>>> +	 * The lookup algorithm was shamelessly taken from the clock
>>> +	 * framework:
>>> +	 *
>>> +	 * We do slightly fuzzy matching here:
>>> +	 *  An entry with a NULL ID is assumed to be a wildcard.
>>> +	 *  If an entry has a device ID, it must match
>>> +	 *  If an entry has a connection ID, it must match
>>> +	 * Then we take the most specific entry - with the following order
>>> +	 * of precedence: dev+con > dev only > con only.
>>> +	 */
>>> +	mutex_lock(&drm_privacy_screen_lookup_lock);
>>> +
>>> +	list_for_each_entry(l, &drm_privacy_screen_lookup_list, list) {
>>> +		match = 0;
>>> +
>>> +		if (l->dev_id) {
>>> +			if (!dev_id || strcmp(l->dev_id, dev_id))
>>> +				continue;
>>> +
>>> +			match += 2;
>>> +		}
>>> +
>>> +		if (l->con_id) {
>>> +			if (!con_id || strcmp(l->con_id, con_id))
>>> +				continue;
>>> +
>>> +			match += 1;
>>> +		}
>>> +
>>> +		if (match > best) {
>>> +			provider = l->provider;
>>> +			best = match;
>>> +		}
>>> +	}
>>> +
>>> +	mutex_unlock(&drm_privacy_screen_lookup_lock);
>>> +
>>> +	if (!provider)
>>> +		return ERR_PTR(-ENODEV);
>>> +
>>> +	priv = drm_privacy_screen_get_by_name(provider);
>>> +	if (!priv)
>>> +		return ERR_PTR(-EPROBE_DEFER);
>>> +
>>> +	return priv;
>>> +}
>>> +EXPORT_SYMBOL(drm_privacy_screen_get);
>>> +
>>> +/**
>>> + * drm_privacy_screen_put - release a privacy-screen reference
>>> + * @priv: privacy screen reference to release
>>> + *
>>> + * Release a privacy-screen provider reference gotten through
>>> + * drm_privacy_screen_get(). May be called with a NULL or ERR_PTR,
>>> + * in which case it is a no-op.
>>> + */
>>> +void drm_privacy_screen_put(struct drm_privacy_screen *priv)
>>> +{
>>> +	if (IS_ERR_OR_NULL(priv))
>>> +		return;
>>> +
>>> +	put_device(&priv->dev);
>>> +}
>>> +EXPORT_SYMBOL(drm_privacy_screen_put);
>>> +
>>> +/**
>>> + * drm_privacy_screen_set_sw_state - set a privacy-screen's sw-state
>>> + * @priv: privacy screen to set the sw-state for
>>> + * @sw_state: new sw-state value to set
>>> + *
>>> + * Set the sw-state of a privacy screen. If the privacy-screen is not
>>> + * in a locked hw-state, then the actual and hw-state of the privacy-screen
>>> + * will be immediately updated to the new value. If the privacy-screen is
>>> + * in a locked hw-state, then the new sw-state will be remembered as the
>>> + * requested state to put the privacy-screen in when it becomes unlocked.
>>> + *
>>> + * Return: 0 on success, negative error code on failure.
>>> + */
>>> +int drm_privacy_screen_set_sw_state(struct drm_privacy_screen *priv,
>>> +				    enum drm_privacy_screen_status sw_state)
>>> +{
>>> +	int ret = 0;
>>> +
>>> +	mutex_lock(&priv->lock);
>>> +
>>> +	if (!priv->ops) {
>>> +		ret = -ENODEV;
>>> +		goto out;
>>> +	}
>>> +
>>> +	/*
>>> +	 * As per the DRM connector properties documentation, setting the
>>> +	 * sw_state while the hw_state is locked is allowed. In this case
>>> +	 * it is a no-op other then storing the new sw_state so that it
>>> +	 * can be honored when the state gets unlocked.
>>> +	 * Also skip the set if the hw already is in the desired state.
>>> +	 */
>>> +	if (priv->hw_state >= PRIVACY_SCREEN_DISABLED_LOCKED ||
>>> +	    priv->hw_state == sw_state) {
>>> +		priv->sw_state = sw_state;
>>> +		goto out;
>>> +	}
>>> +
>>> +	ret = priv->ops->set_sw_state(priv, sw_state);
>>> +out:
>>> +	mutex_unlock(&priv->lock);
>>> +	return ret;
>>> +}
>>> +EXPORT_SYMBOL(drm_privacy_screen_set_sw_state);
>>> +
>>> +/**
>>> + * drm_privacy_screen_get_state - get privacy-screen's current state
>>> + * @priv: privacy screen to get the state for
>>> + * @sw_state_ret: address where to store the privacy-screens current sw-state
>>> + * @hw_state_ret: address where to store the privacy-screens current hw-state
>>> + *
>>> + * Get the current state of a privacy-screen, both the sw-state and the
>>> + * hw-state.
>>> + */
>>> +void drm_privacy_screen_get_state(struct drm_privacy_screen *priv,
>>> +				  enum drm_privacy_screen_status *sw_state_ret,
>>> +				  enum drm_privacy_screen_status *hw_state_ret)
>>> +{
>>> +	mutex_lock(&priv->lock);
>>> +	*sw_state_ret = priv->sw_state;
>>> +	*hw_state_ret = priv->hw_state;
>>> +	mutex_unlock(&priv->lock);
>>> +}
>>> +EXPORT_SYMBOL(drm_privacy_screen_get_state);
>>> +
>>> +/*** drm_privacy_screen_driver.h functions ***/
>>> +
>>> +static ssize_t sw_state_show(struct device *dev,
>>> +			     struct device_attribute *attr, char *buf)
>>> +{
>>> +	struct drm_privacy_screen *priv = to_drm_privacy_screen(dev);
>>> +	const char * const sw_state_names[] = {
>>> +		"Disabled",
>>> +		"Enabled",
>>> +	};
>>> +	ssize_t ret;
>>> +
>>> +	mutex_lock(&priv->lock);
>>> +
>>> +	if (!priv->ops)
>>> +		ret = -ENODEV;
>>> +	else if (WARN_ON(priv->sw_state >= ARRAY_SIZE(sw_state_names)))
>>> +		ret = -ENXIO;
>>> +	else
>>> +		ret = sprintf(buf, "%s\n", sw_state_names[priv->sw_state]);
>>> +
>>> +	mutex_unlock(&priv->lock);
>>> +	return ret;
>>> +}
>>> +/*
>>> + * RO: Do not allow setting the sw_state through sysfs, this MUST be done
>>> + * through the drm_properties on the drm_connector.
>>> + */
>>> +static DEVICE_ATTR_RO(sw_state);
>>> +
>>> +static ssize_t hw_state_show(struct device *dev,
>>> +			     struct device_attribute *attr, char *buf)
>>> +{
>>> +	struct drm_privacy_screen *priv = to_drm_privacy_screen(dev);
>>> +	const char * const hw_state_names[] = {
>>> +		"Disabled",
>>> +		"Enabled",
>>> +		"Disabled, locked",
>>> +		"Enabled, locked",
>>> +	};
>>> +	ssize_t ret;
>>> +
>>> +	mutex_lock(&priv->lock);
>>> +
>>> +	if (!priv->ops)
>>> +		ret = -ENODEV;
>>> +	else if (WARN_ON(priv->hw_state >= ARRAY_SIZE(hw_state_names)))
>>> +		ret = -ENXIO;
>>> +	else
>>> +		ret = sprintf(buf, "%s\n", hw_state_names[priv->hw_state]);
>>> +
>>> +	mutex_unlock(&priv->lock);
>>> +	return ret;
>>> +}
>>> +static DEVICE_ATTR_RO(hw_state);
>>> +
>>> +static struct attribute *drm_privacy_screen_attrs[] = {
>>> +	&dev_attr_sw_state.attr,
>>> +	&dev_attr_hw_state.attr,
>>> +	NULL
>>> +};
>>> +ATTRIBUTE_GROUPS(drm_privacy_screen);
>>> +
>>> +static struct device_type drm_privacy_screen_type = {
>>> +	.name = "privacy_screen",
>>> +	.groups = drm_privacy_screen_groups,
>>> +};
>>> +
>>> +static void drm_privacy_screen_device_release(struct device *dev)
>>> +{
>>> +	struct drm_privacy_screen *priv = to_drm_privacy_screen(dev);
>>> +
>>> +	kfree(priv);
>>> +}
>>> +
>>> +/**
>>> + * drm_privacy_screen_register - register a privacy-screen
>>> + * @parent: parent-device for the privacy-screen
>>> + * @ops: &struct drm_privacy_screen_ops pointer with ops for the privacy-screen
>>> + *
>>> + * Create and register a privacy-screen.
>>> + *
>>> + * Return:
>>> + * * A pointer to the created privacy-screen on success.
>>> + * * An ERR_PTR(errno) on failure.
>>> + */
>>> +struct drm_privacy_screen *drm_privacy_screen_register(
>>> +	struct device *parent, const struct drm_privacy_screen_ops *ops)
>>> +{
>>> +	struct drm_privacy_screen *priv;
>>> +	int ret;
>>> +
>>> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>>> +	if (!priv)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	mutex_init(&priv->lock);
>>> +
>>> +	priv->dev.class = drm_class;
>>> +	priv->dev.type = &drm_privacy_screen_type;
>>> +	priv->dev.parent = parent;
>>> +	priv->dev.release = drm_privacy_screen_device_release;
>>> +	dev_set_name(&priv->dev, "privacy_screen-%s", dev_name(parent));
>>> +	priv->ops = ops;
>>> +
>>> +	priv->ops->get_hw_state(priv);
>>> +
>>> +	ret = device_register(&priv->dev);
>>> +	if (ret) {
>>> +		put_device(&priv->dev);
>>> +		return ERR_PTR(ret);
>>> +	}
>>> +
>>> +	mutex_lock(&drm_privacy_screen_devs_lock);
>>> +	list_add(&priv->list, &drm_privacy_screen_devs);
>>> +	mutex_unlock(&drm_privacy_screen_devs_lock);
>>> +
>>> +	return priv;
>>> +}
>>> +EXPORT_SYMBOL(drm_privacy_screen_register);
>>> +
>>> +/**
>>> + * drm_privacy_screen_unregister - unregister privacy-screen
>>> + * @priv: privacy-screen to unregister
>>> + *
>>> + * Unregister a privacy-screen registered with drm_privacy_screen_register().
>>> + * May be called with a NULL or ERR_PTR, in which case it is a no-op.
>>> + */
>>> +void drm_privacy_screen_unregister(struct drm_privacy_screen *priv)
>>> +{
>>> +	if (IS_ERR_OR_NULL(priv))
>>> +		return;
>>> +
>>> +	mutex_lock(&drm_privacy_screen_devs_lock);
>>> +	list_del(&priv->list);
>>> +	mutex_unlock(&drm_privacy_screen_devs_lock);
>>> +
>>> +	mutex_lock(&priv->lock);
>>> +	priv->ops = NULL;
>>> +	mutex_unlock(&priv->lock);
>>> +
>>> +	device_unregister(&priv->dev);
>>> +}
>>> +EXPORT_SYMBOL(drm_privacy_screen_unregister);
>>> diff --git a/include/drm/drm_privacy_screen_consumer.h b/include/drm/drm_privacy_screen_consumer.h
>>> new file mode 100644
>>> index 000000000000..0cbd23b0453d
>>> --- /dev/null
>>> +++ b/include/drm/drm_privacy_screen_consumer.h
>>> @@ -0,0 +1,50 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright (C) 2020 Red Hat, Inc.
>>> + *
>>> + * Authors:
>>> + * Hans de Goede <hdegoede@redhat.com>
>>> + */
>>> +
>>> +#ifndef __DRM_PRIVACY_SCREEN_CONSUMER_H__
>>> +#define __DRM_PRIVACY_SCREEN_CONSUMER_H__
>>> +
>>> +#include <linux/device.h>
>>> +#include <drm/drm_connector.h>
>>> +
>>> +struct drm_privacy_screen;
>>> +
>>> +#if IS_ENABLED(CONFIG_DRM_PRIVACY_SCREEN)
>>> +struct drm_privacy_screen *drm_privacy_screen_get(struct device *dev,
>>> +						  const char *con_id);
>>> +void drm_privacy_screen_put(struct drm_privacy_screen *priv);
>>> +
>>> +int drm_privacy_screen_set_sw_state(struct drm_privacy_screen *priv,
>>> +				    enum drm_privacy_screen_status sw_state);
>>> +void drm_privacy_screen_get_state(struct drm_privacy_screen *priv,
>>> +				  enum drm_privacy_screen_status *sw_state_ret,
>>> +				  enum drm_privacy_screen_status *hw_state_ret);
>>> +#else
>>> +static inline struct drm_privacy_screen *drm_privacy_screen_get(struct device *dev,
>>> +								const char *con_id)
>>> +{
>>> +	return ERR_PTR(-ENODEV);
>>> +}
>>> +static inline void drm_privacy_screen_put(struct drm_privacy_screen *priv)
>>> +{
>>> +}
>>> +static inline int drm_privacy_screen_set_sw_state(struct drm_privacy_screen *priv,
>>> +						  enum drm_privacy_screen_status sw_state)
>>> +{
>>> +	return -ENODEV;
>>> +}
>>> +static inline void drm_privacy_screen_get_state(struct drm_privacy_screen *priv,
>>> +						enum drm_privacy_screen_status *sw_state_ret,
>>> +						enum drm_privacy_screen_status *hw_state_ret)
>>> +{
>>> +	*sw_state_ret = PRIVACY_SCREEN_DISABLED;
>>> +	*hw_state_ret = PRIVACY_SCREEN_DISABLED;
>>> +}
>>> +#endif
>>> +
>>> +#endif
>>> diff --git a/include/drm/drm_privacy_screen_driver.h b/include/drm/drm_privacy_screen_driver.h
>>> new file mode 100644
>>> index 000000000000..5187ae52eb03
>>> --- /dev/null
>>> +++ b/include/drm/drm_privacy_screen_driver.h
>>> @@ -0,0 +1,80 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright (C) 2020 Red Hat, Inc.
>>> + *
>>> + * Authors:
>>> + * Hans de Goede <hdegoede@redhat.com>
>>> + */
>>> +
>>> +#ifndef __DRM_PRIVACY_SCREEN_DRIVER_H__
>>> +#define __DRM_PRIVACY_SCREEN_DRIVER_H__
>>> +
>>> +#include <linux/device.h>
>>> +#include <linux/list.h>
>>> +#include <linux/mutex.h>
>>> +#include <drm/drm_connector.h>
>>> +
>>> +struct drm_privacy_screen;
>>> +
>>> +/**
>>> + * struct drm_privacy_screen_ops - drm_privacy_screen operations
>>> + *
>>> + * Defines the operations which the privacy-screen class code may call.
>>> + * These functions should be implemented by the privacy-screen driver.
>>> + */
>>> +struct drm_privacy_screen_ops {
>>> +	/**
>>> +	 * @set_sw_state: Called to request a change of the privacy-screen
>>> +	 * state. The privacy-screen class code contains a check to avoid this
>>> +	 * getting called when the hw_state reports the state is locked.
>>> +	 * It is the driver's responsibility to update sw_state and hw_state.
>>> +	 * This is always called with the drm_privacy_screen's lock held.
>>> +	 */
>>> +	int (*set_sw_state)(struct drm_privacy_screen *priv,
>>> +			    enum drm_privacy_screen_status sw_state);
>>> +	/**
>>> +	 * @get_hw_state: Called to request that the driver gets the current
>>> +	 * privacy-screen state from the hardware and then updates sw_state and
>>> +	 * hw_state accordingly. This will be called by the core just before
>>> +	 * the privacy-screen is registered in sysfs.
>>> +	 */
>>> +	void (*get_hw_state)(struct drm_privacy_screen *priv);
>>> +};
>>> +
>>> +/**
>>> + * struct drm_privacy_screen - central privacy-screen structure
>>> + *
>>> + * Central privacy-screen structure, this contains the struct device used
>>> + * to register the screen in sysfs, the screen's state, ops, etc.
>>> + */
>>> +struct drm_privacy_screen {
>>> +	/** @dev: device used to register the privacy-screen in sysfs. */
>>> +	struct device dev;
>>> +	/** @lock: mutex protection all fields in this struct. */
>>> +	struct mutex lock;
>>> +	/** @list: privacy-screen devices list list-entry. */
>>> +	struct list_head list;
>>> +	/**
>>> +	 * @ops: &struct drm_privacy_screen_ops for this privacy-screen.
>>> +	 * This is NULL if the driver has unregistered the privacy-screen.
>>> +	 */
>>> +	const struct drm_privacy_screen_ops *ops;
>>> +	/**
>>> +	 * @sw_state: The privacy-screen's software state, see
>>> +	 * :ref:`Standard Connector Properties<standard_connector_properties>`
>>> +	 * for more info.
>>> +	 */
>>> +	enum drm_privacy_screen_status sw_state;
>>> +	/**
>>> +	 * @hw_state: The privacy-screen's hardware state, see
>>> +	 * :ref:`Standard Connector Properties<standard_connector_properties>`
>>> +	 * for more info.
>>> +	 */
>>> +	enum drm_privacy_screen_status hw_state;
>>> +};
>>> +
>>> +struct drm_privacy_screen *drm_privacy_screen_register(
>>> +	struct device *parent, const struct drm_privacy_screen_ops *ops);
>>> +void drm_privacy_screen_unregister(struct drm_privacy_screen *priv);
>>> +
>>> +#endif
>>> diff --git a/include/drm/drm_privacy_screen_machine.h b/include/drm/drm_privacy_screen_machine.h
>>> new file mode 100644
>>> index 000000000000..aaa0d38cce92
>>> --- /dev/null
>>> +++ b/include/drm/drm_privacy_screen_machine.h
>>> @@ -0,0 +1,41 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright (C) 2020 Red Hat, Inc.
>>> + *
>>> + * Authors:
>>> + * Hans de Goede <hdegoede@redhat.com>
>>> + */
>>> +
>>> +#ifndef __DRM_PRIVACY_SCREEN_MACHINE_H__
>>> +#define __DRM_PRIVACY_SCREEN_MACHINE_H__
>>> +
>>> +#include <linux/list.h>
>>> +
>>> +/**
>>> + * struct drm_privacy_screen_lookup -  static privacy-screen lookup list entry
>>> + *
>>> + * Used for the static lookup-list for mapping privacy-screen consumer
>>> + * dev-connector pairs to a privacy-screen provider.
>>> + */
>>> +struct drm_privacy_screen_lookup {
>>> +	/** @list: Lookup list list-entry. */
>>> +	struct list_head list;
>>> +	/** @dev_id: Consumer device name or NULL to match all devices. */
>>> +	const char *dev_id;
>>> +	/** @con_id: Consumer connector name or NULL to match all connectors. */
>>> +	const char *con_id;
>>> +	/** @provider: dev_name() of the privacy_screen provider. */
>>> +	const char *provider;
>>> +};
>>> +
>>> +void drm_privacy_screen_lookup_add(struct drm_privacy_screen_lookup *lookup);
>>> +void drm_privacy_screen_lookup_remove(struct drm_privacy_screen_lookup *lookup);
>>> +
>>> +static inline void drm_privacy_screen_lookup_init(void)
>>> +{
>>> +}
>>> +static inline void drm_privacy_screen_lookup_exit(void)
>>> +{
>>> +}
>>> +
>>> +#endif
>>>
>>
> 
> 
