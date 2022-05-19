Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F1B52CD36
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 09:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88C711ADA2;
	Thu, 19 May 2022 07:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2513 seconds by postgrey-1.36 at gabe;
 Wed, 18 May 2022 21:53:33 UTC
Received: from mail.ilande.co.uk (mail.ilande.co.uk
 [IPv6:2001:41c9:1:41f::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634A910E76D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 21:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GuRwnGyRDv9dH8R0hRSl+7Wk2VAQo3VPVsbZyhjcYOo=; b=d4Y8AADojKiYOXyRo9cUEpBXhc
 W0IV+IxyxKNwrtjOMHG1+H9CDf9xDoy/ODibUyATv99e6bf8qV5wnWuobFdUfl78EPznIrxfqsVg4
 eq4h1PLaQskUWsLpqUwmNYx5/sGt2W/oFke4GlMaNCJfq3kBAR8zyc1P+xzdfFUCLpDFLQl8aaDgS
 6bvkqbGOYV0FboGykPReonk2UdDe0Asd4TLtT+q/Imn01z27eLshIk1dKPRtEGJW1fe3KT46c0orK
 y4LPiLqt0pN+dyE6fI8oIm/zoPEUTorjxTtcOO2wD2IsZQky6YOyUGxa/BwY8DQEqYx3HFL9b5wQc
 qd1tOHYE7VZBa0/1iKa2QVyK03XiPAQBynZzXZHQJoaUuxZXH1+Rrnid3DGf3UBexBVfEq37y7o9A
 TGgcKffn+Vx21AcsBb9smnaKBAOFbjh/WJNMtxCCBIGTAylgtyJCnzEiRye5BOt6dLXGQVi74Q4Ur
 2hRlxDqG0DghU2p6QmxVVjvFDvYv1w0lZeaAql6m5su4OPS5/8AaEJk790M13ChkPxKfZRKBg3NpX
 whuz+eeAIhK8AewVewcR5pfSS5ROppIpCEkWVPy++GQEDKhME6FQwasU8oGEhvbO8ikrkoCtR32+w
 TqFTv/kjQGIzSVFFmyOQmf6bFJELIP/a9WrxWOzAY=;
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nrQvm-0003T2-F9; Wed, 18 May 2022 22:10:10 +0100
Message-ID: <6e76b6dc-f6e8-e9f9-8760-0f6f866546d3@ilande.co.uk>
Date: Wed, 18 May 2022 22:11:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech,
 sam@ravnborg.org, msuchanek@suse.de, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org
References: <20220518183006.14548-1-tzimmermann@suse.de>
 <20220518183006.14548-3-tzimmermann@suse.de>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220518183006.14548-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 mail.default.ilande.bv.iomart.io
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH 2/2] drm/tiny: Add ofdrm for Open Firmware framebuffers
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
X-Mailman-Approved-At: Thu, 19 May 2022 07:35:33 +0000
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/05/2022 19:30, Thomas Zimmermann wrote:

> Open Firmware provides basic display output via the 'display' node.
> DT platform code already provides a device that represents the node's
> framebuffer. Add a DRM driver for the device. The display mode and
> color format is pre-initialized by the system's firmware. Runtime
> modesetting via DRM is not possible. The display is useful during
> early boot stages or as error fallback.
> 
> Similar functionality is already provided by fbdev's offb driver,
> which is insufficient for modern userspace. The old driver includes
> support for BootX device tree, which can be found on old 32-bit
> PowerPC Macintosh systems. If these are still in use, the
> functionality can be added to ofdrm or implemented in a new
> driver. As with simepldrm, the fbdev driver cannot be selected is
> ofdrm is already enabled.
> 
> Two noteable points about the driver:
> 
>   * Reading the framebuffer aperture from the device tree is not
> reliable on all systems. Ofdrm takes the heuristics and a comment
> from offb to pick the correct range.
> 
>   * No resource management may be tied to the underlying PCI device.
> Otherwise the handover to the native driver will fail with a resource
> conflict. PCI management is therefore done as part of the platform
> device's cleanup.
> 
> The driver has been tested on qemu's ppc64le emulation. The device
> hand-over has been tested with bochs.

Thanks for working on this! Have you tried it on qemu-system-sparc and 
qemu-system-sparc64 at all? At least under QEMU I'd expect it to work for these 
platforms too, unless there is a particular dependency on PCI. A couple of comments 
inline below:

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   MAINTAINERS                   |   1 +
>   drivers/gpu/drm/tiny/Kconfig  |  12 +
>   drivers/gpu/drm/tiny/Makefile |   1 +
>   drivers/gpu/drm/tiny/ofdrm.c  | 748 ++++++++++++++++++++++++++++++++++
>   drivers/video/fbdev/Kconfig   |   1 +
>   5 files changed, 763 insertions(+)
>   create mode 100644 drivers/gpu/drm/tiny/ofdrm.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 43d833273ae9..090cbe1aa5e3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6395,6 +6395,7 @@ L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git git://anongit.freedesktop.org/drm/drm-misc
>   F:	drivers/gpu/drm/drm_aperture.c
> +F:	drivers/gpu/drm/tiny/ofdrm.c
>   F:	drivers/gpu/drm/tiny/simpledrm.c
>   F:	include/drm/drm_aperture.h
>   
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index 627d637a1e7e..0bc54af42e7f 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -51,6 +51,18 @@ config DRM_GM12U320
>   	 This is a KMS driver for projectors which use the GM12U320 chipset
>   	 for video transfer over USB2/3, such as the Acer C120 mini projector.
>   
> +config DRM_OFDRM
> +	tristate "Open Firmware display driver"
> +	depends on DRM && MMU && PPC
> +	select DRM_GEM_SHMEM_HELPER
> +	select DRM_KMS_HELPER
> +	help
> +	  DRM driver for Open Firmware framebuffers.
> +
> +	  This driver assumes that the display hardware has been initialized
> +	  by the Open Firmware before the kernel boots. Scanout buffer, size,
> +	  and display format must be provided via device tree.
> +
>   config DRM_PANEL_MIPI_DBI
>   	tristate "DRM support for MIPI DBI compatible panels"
>   	depends on DRM && SPI
> diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
> index 1d9d6227e7ab..76dde89a044b 100644
> --- a/drivers/gpu/drm/tiny/Makefile
> +++ b/drivers/gpu/drm/tiny/Makefile
> @@ -4,6 +4,7 @@ obj-$(CONFIG_DRM_ARCPGU)		+= arcpgu.o
>   obj-$(CONFIG_DRM_BOCHS)			+= bochs.o
>   obj-$(CONFIG_DRM_CIRRUS_QEMU)		+= cirrus.o
>   obj-$(CONFIG_DRM_GM12U320)		+= gm12u320.o
> +obj-$(CONFIG_DRM_OFDRM)			+= ofdrm.o
>   obj-$(CONFIG_DRM_PANEL_MIPI_DBI)	+= panel-mipi-dbi.o
>   obj-$(CONFIG_DRM_SIMPLEDRM)		+= simpledrm.o
>   obj-$(CONFIG_TINYDRM_HX8357D)		+= hx8357d.o
> diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
> new file mode 100644
> index 000000000000..aca715b36179
> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/ofdrm.c
> @@ -0,0 +1,748 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +
> +#include <drm/drm_aperture.h>
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_format_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +
> +#define DRIVER_NAME	"ofdrm"
> +#define DRIVER_DESC	"DRM driver for OF platform devices"
> +#define DRIVER_DATE	"20220501"
> +#define DRIVER_MAJOR	1
> +#define DRIVER_MINOR	0
> +
> +/*
> + * Assume a monitor resolution of 96 dpi to
> + * get a somewhat reasonable screen size.
> + */
> +#define RES_MM(d)	\
> +	(((d) * 254ul) / (96ul * 10ul))
> +
> +#define OFDRM_MODE(hd, vd)	\
> +	DRM_SIMPLE_MODE(hd, vd, RES_MM(hd), RES_MM(vd))
> +
> +/*
> + * Helpers for display nodes
> + */
> +
> +static int display_get_validated_int(struct drm_device *dev, const char *name, uint32_t value)
> +{
> +	if (value > INT_MAX) {
> +		drm_err(dev, "invalid framebuffer %s of %u\n", name, value);
> +		return -EINVAL;
> +	}
> +	return (int)value;
> +}
> +
> +static int display_get_validated_int0(struct drm_device *dev, const char *name, uint32_t value)
> +{
> +	if (!value) {
> +		drm_err(dev, "invalid framebuffer %s of %u\n", name, value);
> +		return -EINVAL;
> +	}
> +	return display_get_validated_int(dev, name, value);
> +}
> +
> +static const struct drm_format_info *display_get_validated_format(struct drm_device *dev,
> +								  u32 depth)
> +{
> +	const struct drm_format_info *info;
> +	u32 format;
> +
> +	switch (depth) {
> +	case 8:
> +		format = drm_mode_legacy_fb_format(8, 8);
> +		break;
> +	case 15:
> +	case 16:
> +		format = drm_mode_legacy_fb_format(16, depth);
> +		break;
> +	case 32:
> +		format = drm_mode_legacy_fb_format(32, 24);
> +		break;
> +	default:
> +		drm_err(dev, "unsupported framebuffer depth %u\n", depth);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	info = drm_format_info(format);
> +	if (!info) {
> +		drm_err(dev, "cannot find framebuffer format for depth %u\n", depth);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	return info;
> +}
> +
> +static int display_read_u32_of(struct drm_device *dev, struct device_node *of_node,
> +			       const char *name, u32 *value)
> +{
> +	int ret = of_property_read_u32(of_node, name, value);
> +
> +	if (ret)
> +		drm_err(dev, "cannot parse framebuffer %s: error %d\n", name, ret);
> +	return ret;
> +}
> +
> +static int display_get_width_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +	u32 width;
> +	int ret = display_read_u32_of(dev, of_node, "width", &width);
> +
> +	if (ret)
> +		return ret;
> +	return display_get_validated_int0(dev, "width", width);
> +}
> +
> +static int display_get_height_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +	u32 height;
> +	int ret = display_read_u32_of(dev, of_node, "height", &height);
> +
> +	if (ret)
> +		return ret;
> +	return display_get_validated_int0(dev, "height", height);
> +}
> +
> +static int display_get_linebytes_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +	u32 linebytes;
> +	int ret = display_read_u32_of(dev, of_node, "linebytes", &linebytes);
> +
> +	if (ret)
> +		return ret;
> +	return display_get_validated_int(dev, "linebytes", linebytes);
> +}
> +
> +static const struct drm_format_info *display_get_format_of(struct drm_device *dev,
> +							   struct device_node *of_node)
> +{
> +	u32 depth;
> +	int ret = display_read_u32_of(dev, of_node, "depth", &depth);
> +
> +	if (ret)
> +		return ERR_PTR(ret);
> +	return display_get_validated_format(dev, depth);
> +}
> +
> +static u64 display_get_address_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +	u32 address;
> +	int ret;
> +
> +	/*
> +	 * Not all devices provide an address property, it's not
> +	 * a bug if this fails. The driver will try to find the
> +	 * framebuffer base address from the device's memory regions.
> +	 */
> +	ret = of_property_read_u32(of_node, "address", &address);
> +	if (ret)
> +		return OF_BAD_ADDR;
> +
> +	return address;
> +}
> +
> +#if defined(CONFIG_PCI)
> +static struct pci_dev *display_get_pci_dev_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +	const __be32 *vendor_p, *device_p;
> +	u32 vendor, device;
> +	struct pci_dev *pcidev;
> +
> +	vendor_p = of_get_property(of_node, "vendor-id", NULL);
> +	if (!vendor_p)
> +		return ERR_PTR(-ENODEV);
> +	vendor = be32_to_cpup(vendor_p);
> +
> +	device_p = of_get_property(of_node, "device-id", NULL);
> +	if (!device_p)
> +		return ERR_PTR(-ENODEV);
> +	device = be32_to_cpup(device_p);
> +
> +	pcidev = pci_get_device(vendor, device, NULL);
> +	if (!pcidev)
> +		return ERR_PTR(-ENODEV);
> +
> +	return pcidev;
> +}
> +#else
> +static struct pci_dev *display_get_pci_dev_of(struct drm_device *dev, struct device_node *of_node)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +#endif
> +
> +/*
> + * Open Firmware display device
> + */
> +
> +struct ofdrm_device {
> +	struct drm_device dev;
> +	struct platform_device *pdev;
> +
> +	/* OF display settings */
> +	struct drm_display_mode mode;
> +	const struct drm_format_info *format;
> +	unsigned int pitch;
> +	resource_size_t fb_base;
> +	resource_size_t fb_size;
> +
> +	/* memory management */
> +	struct resource *mem;
> +	void __iomem *screen_base;
> +
> +	/* modesetting */
> +	uint32_t formats[8];
> +	size_t nformats;
> +	struct drm_connector connector;
> +	struct drm_simple_display_pipe pipe;
> +};
> +
> +static struct ofdrm_device *ofdrm_device_of_dev(struct drm_device *dev)
> +{
> +	return container_of(dev, struct ofdrm_device, dev);
> +}
> +
> +/*
> + *  OF display settings
> + */
> +
> +static void ofdrm_pci_release(void *data)
> +{
> +	struct pci_dev *pcidev = data;
> +
> +	pci_disable_device(pcidev);
> +}
> +
> +static struct drm_display_mode ofdrm_mode(unsigned int width, unsigned int height)
> +{
> +	struct drm_display_mode mode = { OFDRM_MODE(width, height) };
> +
> +	mode.clock = mode.hdisplay * mode.vdisplay * 60 / 1000 /* kHz */;
> +	drm_mode_set_name(&mode);
> +
> +	return mode;
> +}
> +
> +static struct resource *ofdrm_find_fb_resource(struct ofdrm_device *odev,
> +					       struct resource *fb_res)
> +{
> +	struct platform_device *pdev = to_platform_device(odev->dev.dev);
> +	struct resource *res, *max_res = NULL;
> +	u32 i;
> +
> +	for (i = 0; pdev->num_resources; ++i) {
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
> +		if (!res)
> +			break; /* all resources processed */
> +		if (resource_size(res) < resource_size(fb_res))
> +			continue; /* resource too small */
> +		if (fb_res->start && resource_contains(res, fb_res))
> +			return res; /* resource contains framebuffer */
> +		if (!max_res || resource_size(res) > resource_size(max_res))
> +			max_res = res; /* store largest resource as fallback */
> +	}
> +
> +	return max_res;
> +}
> +
> +static int ofdrm_device_init_fb(struct ofdrm_device *odev)
> +{
> +	struct drm_device *dev = &odev->dev;
> +	struct platform_device *pdev = odev->pdev;
> +	struct device_node *of_node = pdev->dev.of_node;
> +	int width, height, linebytes;
> +	u64 address;
> +	const struct drm_format_info *format;
> +	struct pci_dev *pcidev;
> +	struct resource *res;
> +	int ret;
> +
> +	width = display_get_width_of(dev, of_node);
> +	if (width < 0)
> +		return width;
> +	height = display_get_height_of(dev, of_node);
> +	if (height < 0)
> +		return height;
> +	linebytes = display_get_linebytes_of(dev, of_node);
> +	if (linebytes < 0)
> +		return linebytes;
> +	format = display_get_format_of(dev, of_node);
> +	if (IS_ERR(format))
> +		return PTR_ERR(format);
> +	address = display_get_address_of(dev, of_node);
> +
> +	/*
> +	 * Never use pcim_ or other managed helpers on the returned PCI
> +	 * device. Otherwise, probing the native driver will fail for
> +	 * resource conflicts. PCI-device management has to be tied to
> +	 * the lifetime of the platform device until the native driver
> +	 * takes over.
> +	 */
> +	pcidev = display_get_pci_dev_of(dev, of_node);
> +	if (!IS_ERR(pcidev)) {
> +		ret = pci_enable_device(pcidev);
> +		if (drm_WARN(dev, ret, "pci_enable_device(%s) failed: %d\n",
> +			     dev_name(&pcidev->dev), ret))
> +			return ret;
> +		ret = devm_add_action_or_reset(&pdev->dev, ofdrm_pci_release, pcidev);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	odev->mode = ofdrm_mode(width, height);
> +	odev->format = format;
> +
> +	if (linebytes)
> +		odev->pitch = linebytes;
> +	else
> +		odev->pitch = width * format->cpp[0];
> +
> +	odev->fb_size = odev->pitch * height;
> +
> +	/*
> +	 * Try to figure out the address of the framebuffer. Unfortunately, Open
> +	 * Firmware doesn't provide a standard way to do so. All we can do is a
> +	 * dodgy heuristic that happens to work in practice.

This isn't quite true: there is a Forth value named "frame-buffer-adr" which should 
be set to the physical screen base address for PCI and non-PCI cards. It is mentioned 
in both the IEEE-1275 specification (page 32) and according to OpenBIOS is also 
referenced by BootX: 
https://mail.coreboot.org/pipermail/openbios/2011-August/006617.html.

> +	 * On most machines, the "address" property contains what we need, though
> +	 * not on Matrox cards found in IBM machines. What appears to give good
> +	 * results is to go through the PCI ranges and pick one that encloses the
> +	 * "address" property. If none match, we pick the largest.
> +	 */

In my experience so far "frame-buffer-adr" is the definitive way to get the screen 
physical address, however you'll need to call the CIF interface in order to get the 
value. The cases where I've seen an "address" property in the display node is when 
the display has also been mapped to a virtual address, which may or may not be the 
same as the physical address. I suspect this optional virtual mapping may not be 
present by the time the ofdrm driver loads?

> +	if (address != OF_BAD_ADDR) {
> +		struct resource fb_res = DEFINE_RES_MEM(address, odev->fb_size);
> +
> +		res = ofdrm_find_fb_resource(odev, &fb_res);
> +		if (!res)
> +			return -EINVAL;
> +		if (resource_contains(res, &fb_res))
> +			odev->fb_base = address;
> +		else
> +			odev->fb_base = res->start;
> +	} else {
> +		struct resource fb_res = DEFINE_RES_MEM(0u, odev->fb_size);
> +
> +		res = ofdrm_find_fb_resource(odev, &fb_res);
> +		if (!res)
> +			return -EINVAL;
> +		odev->fb_base = res->start;
> +	}
> +
> +	drm_dbg(dev, "display mode={" DRM_MODE_FMT "}\n", DRM_MODE_ARG(&odev->mode));
> +	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, linebytes=%d byte, address=0x%llx\n",
> +		&format->format, width, height, linebytes, address);
> +
> +	return 0;
> +}
> +
> +/*
> + * Memory management
> + */
> +
> +static int ofdrm_device_init_mm(struct ofdrm_device *odev)
> +{
> +	struct drm_device *dev = &odev->dev;
> +	struct platform_device *pdev = odev->pdev;
> +	struct resource res = DEFINE_RES_MEM(odev->fb_base, round_up(odev->fb_size, PAGE_SIZE));
> +	struct resource *mem;
> +	void __iomem *screen_base;
> +	int ret;
> +
> +	ret = devm_aperture_acquire_from_firmware(dev, res.start, resource_size(&res));
> +	if (ret) {
> +		drm_err(dev, "could not acquire memory range %pr: error %d\n", &res, ret);
> +		return ret;
> +	}
> +
> +	mem = devm_request_mem_region(&pdev->dev, res.start, resource_size(&res),
> +				      odev->dev.driver->name);
> +	if (!mem) {
> +		drm_warn(dev, "could not acquire memory region %pr\n", &res);
> +		return -ENOMEM;
> +	}
> +
> +	drm_dbg(dev, "mapping framebuffer: %pr\n", mem);
> +
> +	screen_base = devm_ioremap(&pdev->dev, mem->start, resource_size(mem));
> +	if (drm_WARN_ON(dev, !screen_base))
> +		return -ENOMEM;
> +
> +	odev->mem = mem;
> +	odev->screen_base = screen_base;
> +
> +	drm_dbg(dev, "framebuffer at %pr, mapped at 0x%p\n", mem, screen_base);
> +
> +	return 0;
> +}
> +
> +/*
> + * Modesetting
> + */
> +
> +/*
> + * Support all formats of OF display and maybe more; in order
> + * of preference. The display's update function will do any
> + * conversion necessary.
> + *
> + * TODO: Add blit helpers for remaining formats and uncomment
> + *       constants.
> + */
> +static const uint32_t ofdrm_default_formats[] = {
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_RGB565,
> +	//DRM_FORMAT_XRGB1555,
> +	DRM_FORMAT_C8,
> +};
> +
> +static const uint64_t ofdrm_format_modifiers[] = {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID
> +};
> +
> +static int ofdrm_connector_helper_get_modes(struct drm_connector *connector)
> +{
> +	struct ofdrm_device *odev = ofdrm_device_of_dev(connector->dev);
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, &odev->mode);
> +	if (!mode)
> +		return 0;
> +
> +	if (mode->name[0] == '\0')
> +		drm_mode_set_name(mode);
> +
> +	mode->type |= DRM_MODE_TYPE_PREFERRED;
> +	drm_mode_probed_add(connector, mode);
> +
> +	if (mode->width_mm)
> +		connector->display_info.width_mm = mode->width_mm;
> +	if (mode->height_mm)
> +		connector->display_info.height_mm = mode->height_mm;
> +
> +	return 1;
> +}
> +
> +static const struct drm_connector_helper_funcs ofdrm_connector_helper_funcs = {
> +	.get_modes = ofdrm_connector_helper_get_modes,
> +};
> +
> +static const struct drm_connector_funcs ofdrm_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static int ofdrm_simple_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
> +						const struct drm_display_mode *mode)
> +{
> +	struct ofdrm_device *odev = ofdrm_device_of_dev(pipe->crtc.dev);
> +
> +	if (mode->hdisplay != odev->mode.hdisplay &&
> +	    mode->vdisplay != odev->mode.vdisplay)
> +		return MODE_ONE_SIZE;
> +	else if (mode->hdisplay != odev->mode.hdisplay)
> +		return MODE_ONE_WIDTH;
> +	else if (mode->vdisplay != odev->mode.vdisplay)
> +		return MODE_ONE_HEIGHT;
> +
> +	return MODE_OK;
> +}
> +
> +static void ofdrm_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
> +					     struct drm_crtc_state *crtc_state,
> +					     struct drm_plane_state *plane_state)
> +{
> +	struct ofdrm_device *odev = ofdrm_device_of_dev(pipe->crtc.dev);
> +	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
> +	struct drm_framebuffer *fb = plane_state->fb;
> +	void *vmap = shadow_plane_state->data[0].vaddr; /* TODO: Use mapping abstraction */
> +	struct drm_device *dev = &odev->dev;
> +	void __iomem *dst = odev->screen_base;
> +	struct drm_rect src_clip, dst_clip;
> +	int idx;
> +
> +	if (!fb)
> +		return;
> +
> +	drm_rect_fp_to_int(&src_clip, &plane_state->src);
> +
> +	dst_clip = plane_state->dst;
> +	if (!drm_rect_intersect(&dst_clip, &src_clip))
> +		return;
> +
> +	if (!drm_dev_enter(dev, &idx))
> +		return;
> +
> +	dst += drm_fb_clip_offset(odev->pitch, odev->format, &dst_clip);
> +	drm_fb_blit_toio(dst, odev->pitch, odev->format->format, vmap, fb, &src_clip);
> +
> +	drm_dev_exit(idx);
> +}
> +
> +static void ofdrm_simple_display_pipe_disable(struct drm_simple_display_pipe *pipe)
> +{
> +	struct ofdrm_device *odev = ofdrm_device_of_dev(pipe->crtc.dev);
> +	struct drm_device *dev = &odev->dev;
> +	int idx;
> +
> +	if (!drm_dev_enter(dev, &idx))
> +		return;
> +
> +	/* Clear screen to black if disabled */
> +	memset_io(odev->screen_base, 0, odev->pitch * odev->mode.vdisplay);
> +
> +	drm_dev_exit(idx);
> +}
> +
> +static void ofdrm_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
> +					     struct drm_plane_state *old_plane_state)
> +{
> +	struct ofdrm_device *odev = ofdrm_device_of_dev(pipe->crtc.dev);
> +	struct drm_plane_state *plane_state = pipe->plane.state;
> +	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
> +	void *vmap = shadow_plane_state->data[0].vaddr; /* TODO: Use mapping abstraction */
> +	struct drm_framebuffer *fb = plane_state->fb;
> +	struct drm_device *dev = &odev->dev;
> +	struct drm_atomic_helper_damage_iter damage_iter;
> +	struct drm_rect src_clip, dst_clip;
> +	void __iomem *dst;
> +	int idx;
> +
> +	if (!fb)
> +		return;
> +
> +	if (!drm_dev_enter(dev, &idx))
> +		return;
> +
> +	drm_atomic_helper_damage_iter_init(&damage_iter, old_plane_state, plane_state);
> +	drm_atomic_for_each_plane_damage(&damage_iter, &src_clip) {
> +
> +		dst_clip = plane_state->dst;
> +		if (!drm_rect_intersect(&dst_clip, &src_clip))
> +			continue;
> +
> +		dst = odev->screen_base;
> +		dst += drm_fb_clip_offset(odev->pitch, odev->format, &dst_clip);
> +		drm_fb_blit_toio(dst, odev->pitch, odev->format->format, vmap, fb, &src_clip);
> +	}
> +
> +	drm_dev_exit(idx);
> +}
> +
> +static const struct drm_simple_display_pipe_funcs ofdrm_simple_display_pipe_funcs = {
> +	.mode_valid = ofdrm_simple_display_pipe_mode_valid,
> +	.enable = ofdrm_simple_display_pipe_enable,
> +	.disable = ofdrm_simple_display_pipe_disable,
> +	.update = ofdrm_simple_display_pipe_update,
> +	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
> +};
> +
> +static const struct drm_mode_config_funcs ofdrm_mode_config_funcs = {
> +	.fb_create = drm_gem_fb_create_with_dirty,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +};
> +
> +static const uint32_t *ofdrm_device_formats(struct ofdrm_device *odev, size_t *nformats_out)
> +{
> +	struct drm_device *dev = &odev->dev;
> +	size_t i;
> +
> +	if (odev->nformats)
> +		goto out; /* don't rebuild list on recurring calls */
> +
> +	/* native format goes first */
> +	odev->formats[0] = odev->format->format;
> +	odev->nformats = 1;
> +
> +	/* default formats go second */
> +	for (i = 0; i < ARRAY_SIZE(ofdrm_default_formats); ++i) {
> +		if (ofdrm_default_formats[i] == odev->format->format)
> +			continue; /* native format already went first */
> +		odev->formats[odev->nformats] = ofdrm_default_formats[i];
> +		odev->nformats++;
> +	}
> +
> +	/*
> +	 * TODO: The ofdrm driver converts framebuffers to the native
> +	 * format when copying them to device memory. If there are more
> +	 * formats listed than supported by the driver, the native format
> +	 * is not supported by the conversion helpers. Therefore *only*
> +	 * support the native format and add a conversion helper ASAP.
> +	 */
> +	if (drm_WARN_ONCE(dev, i != odev->nformats,
> +			  "format conversion helpers required for %p4cc",
> +			  &odev->format->format)) {
> +		odev->nformats = 1;
> +	}
> +
> +out:
> +	*nformats_out = odev->nformats;
> +	return odev->formats;
> +}
> +
> +static int ofdrm_device_init_modeset(struct ofdrm_device *odev)
> +{
> +	struct drm_device *dev = &odev->dev;
> +	struct drm_display_mode *mode = &odev->mode;
> +	struct drm_connector *connector = &odev->connector;
> +	struct drm_simple_display_pipe *pipe = &odev->pipe;
> +	unsigned long max_width, max_height;
> +	const uint32_t *formats;
> +	size_t nformats;
> +	int ret;
> +
> +	ret = drmm_mode_config_init(dev);
> +	if (ret)
> +		return ret;
> +
> +	max_width = max_t(unsigned long, mode->hdisplay, DRM_SHADOW_PLANE_MAX_WIDTH);
> +	max_height = max_t(unsigned long, mode->vdisplay, DRM_SHADOW_PLANE_MAX_HEIGHT);
> +
> +	dev->mode_config.min_width = mode->hdisplay;
> +	dev->mode_config.max_width = max_width;
> +	dev->mode_config.min_height = mode->vdisplay;
> +	dev->mode_config.max_height = max_height;
> +	dev->mode_config.preferred_depth = odev->format->cpp[0] * 8;
> +	dev->mode_config.funcs = &ofdrm_mode_config_funcs;
> +
> +	ret = drm_connector_init(dev, connector, &ofdrm_connector_funcs,
> +				 DRM_MODE_CONNECTOR_Unknown);
> +	if (ret)
> +		return ret;
> +	drm_connector_helper_add(connector, &ofdrm_connector_helper_funcs);
> +	drm_connector_set_panel_orientation_with_quirk(connector,
> +						       DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
> +						       mode->hdisplay, mode->vdisplay);
> +
> +	formats = ofdrm_device_formats(odev, &nformats);
> +
> +	ret = drm_simple_display_pipe_init(dev, pipe, &ofdrm_simple_display_pipe_funcs,
> +					   formats, nformats, ofdrm_format_modifiers,
> +					   connector);
> +	if (ret)
> +		return ret;
> +
> +	drm_plane_enable_fb_damage_clips(&pipe->plane);
> +
> +	drm_mode_config_reset(dev);
> +
> +	return 0;
> +}
> +
> +/*
> + * Init / Cleanup
> + */
> +
> +static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
> +						struct platform_device *pdev)
> +{
> +	struct ofdrm_device *odev;
> +	int ret;
> +
> +	odev = devm_drm_dev_alloc(&pdev->dev, drv, struct ofdrm_device, dev);
> +	if (IS_ERR(odev))
> +		return ERR_CAST(odev);
> +	odev->pdev = pdev;
> +	platform_set_drvdata(pdev, &odev->dev);
> +
> +	ret = ofdrm_device_init_fb(odev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +	ret = ofdrm_device_init_mm(odev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +	ret = ofdrm_device_init_modeset(odev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return odev;
> +}
> +
> +/*
> + * DRM driver
> + */
> +
> +DEFINE_DRM_GEM_FOPS(ofdrm_fops);
> +
> +static struct drm_driver ofdrm_driver = {
> +	DRM_GEM_SHMEM_DRIVER_OPS,
> +	.name			= DRIVER_NAME,
> +	.desc			= DRIVER_DESC,
> +	.date			= DRIVER_DATE,
> +	.major			= DRIVER_MAJOR,
> +	.minor			= DRIVER_MINOR,
> +	.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
> +	.fops			= &ofdrm_fops,
> +};
> +
> +/*
> + * Platform driver
> + */
> +
> +static int ofdrm_probe(struct platform_device *pdev)
> +{
> +	struct ofdrm_device *odev;
> +	struct drm_device *dev;
> +	int ret;
> +
> +	odev = ofdrm_device_create(&ofdrm_driver, pdev);
> +	if (IS_ERR(odev))
> +		return PTR_ERR(odev);
> +	dev = &odev->dev;
> +
> +	ret = drm_dev_register(dev, 0);
> +	if (ret)
> +		return ret;
> +
> +	drm_fbdev_generic_setup(dev, 0);
> +
> +	return 0;
> +}
> +
> +static int ofdrm_remove(struct platform_device *pdev)
> +{
> +	struct drm_device *dev = platform_get_drvdata(pdev);
> +
> +	drm_dev_unplug(dev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ofdrm_of_match_display[] = {
> +	{ .compatible = "display", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, ofdrm_of_match_display);
> +
> +static struct platform_driver ofdrm_platform_driver = {
> +	.driver = {
> +		.name = "of-display",
> +		.of_match_table = ofdrm_of_match_display,
> +	},
> +	.probe = ofdrm_probe,
> +	.remove = ofdrm_remove,
> +};
> +
> +module_platform_driver(ofdrm_platform_driver);
> +
> +MODULE_DESCRIPTION(DRIVER_DESC);
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index e8a94e202d63..a4982dc3aa0d 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -455,6 +455,7 @@ config FB_ATARI
>   config FB_OF
>   	bool "Open Firmware frame buffer device support"
>   	depends on (FB = y) && PPC && (!PPC_PSERIES || PCI)
> +	depends on !DRM_OFDRM
>   	select FB_CFB_FILLRECT
>   	select FB_CFB_COPYAREA
>   	select FB_CFB_IMAGEBLIT


ATB,

Mark.
