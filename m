Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 803D898ED61
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 12:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE2C10E7F6;
	Thu,  3 Oct 2024 10:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IRYuxyuu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6716810E7F3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 10:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727952860; x=1759488860;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=cemKCFynXEWl2Xt8fGifO/SbXzm4vmuciVt4QuqxDSE=;
 b=IRYuxyuuSckhv2IYq/LcSJtfywwiwyqizq0N/QjiVrXxwzZ+2CQYr4zL
 fQooUr9MogbUUDaMyH6rmaRcEE8OkcXHMyi5eWggIsw576WI5A1g4OxZa
 9iBpbawz+Uym4Uu4RN6URwcXWdX8EtWCODw1cqv+pKz0eUNzQ3949/gy6
 PRalWtN/61JEqPjD2CUsxyD+UtDQ0gUYc8QprnoQyN9ud9i9BHnV+rlsw
 rN5Yz1teBAa3ATM+7+xTrMNU+XO88C0MgOLHQhCU+ZAoJWkZ8Ur8dAbvP
 sY22IvV9+I+HcqBHo+f/jbAwYzWOnA+ollXhPW9J/lr+im56eOneppUzW A==;
X-CSE-ConnectionGUID: CR2m06b0Q1mmmX/koZ/Jaw==
X-CSE-MsgGUID: rel76BvTTHmp4AfadSLdLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27028017"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="27028017"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 03:54:19 -0700
X-CSE-ConnectionGUID: wO8se0JSQuuas7qDjlpyyQ==
X-CSE-MsgGUID: Bi38i0JETueWAkPm3+l2Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="73898912"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.198])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 03:54:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 3 Oct 2024 13:54:09 +0300 (EEST)
To: Werner Sembach <wse@tuxedocomputers.com>
cc: Hans de Goede <hdegoede@redhat.com>, bentiss@kernel.org, 
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org, 
 lee@kernel.org, linux-input@vger.kernel.org, 
 LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org, 
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com, 
 pavel@ucw.cz, cs@tuxedo.de, platform-driver-x86@vger.kernel.org
Subject: Re: [RFC PATCH v4 1/1] platform/x86/tuxedo: Add virtual LampArray
 for TUXEDO NB04 devices
In-Reply-To: <fdfaaad5-59e7-4825-bc06-db44831ac741@tuxedocomputers.com>
Message-ID: <49beebf1-db73-a3a1-3376-e1822ce2e569@linux.intel.com>
References: <20241001180658.76396-1-wse@tuxedocomputers.com>
 <20241001180658.76396-2-wse@tuxedocomputers.com>
 <bc3f5f2b-252e-0a66-df0f-f01197a5a17d@linux.intel.com>
 <fdfaaad5-59e7-4825-bc06-db44831ac741@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1514972353-1727951671=:970"
Content-ID: <4f408931-25f2-564f-b4be-38607c3ca070@linux.intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1514972353-1727951671=:970
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <9d3e79d1-6acc-c382-1090-0cf8feca554d@linux.intel.com>

On Wed, 2 Oct 2024, Werner Sembach wrote:
> Am 02.10.24 um 11:52 schrieb Ilpo J=E4rvinen:
> > On Tue, 1 Oct 2024, Werner Sembach wrote:
> >=20
> > > The TUXEDO Sirius 16 Gen1 and TUXEDO Sirius 16 Gen2 devices have a pe=
r-key
> > > controllable RGB keyboard backlight. The firmware API for it is
> > > implemented
> > > via WMI.
> > >=20
> > > To make the backlight userspace configurable this driver emulates a
> > > LampArray HID device and translates the input from hidraw to the
> > > corresponding WMI calls. This is a new approach as the leds subsystem
> > > lacks
> > > a suitable UAPI for per-key keyboard backlights, and like this no new=
 UAPI
> > > needs to be established.
> > >=20
> > > v2: Integrated Armins feedback and fixed kernel test robot warnings.
> > > v3: Fixed borked subject line of v2.
> > > v4: Remove unrequired WMI mutex.
> > >      Move device checking from probe to init.
> > >      Fix device checking working exactly reverse as it should.
> > >      Fix null pointer dereference because, hdev->driver_data !=3D
> > > hdev->dev.driver_data.
> > >=20
> > > Co-developed-by: Christoffer Sandberg <cs@tuxedo.de>
> > > Signed-off-by: Christoffer Sandberg <cs@tuxedo.de>
> > > Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> > > Link:
> > > https://lore.kernel.org/all/1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxe=
docomputers.com/
> > > ---

I came across few new things that I didn't notice previously while=20
writing this reply. I tried to cut the reply size down so hopefully they=20
don't get lost as easily.

> > > +=090x29, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f, 0x40, 0x41, 0x42,
> > > +=090x43, 0x44, 0x45, 0xf1, 0x46, 0x4c,   0x4a, 0x4d, 0x4b, 0x4e,
> > > +=090x35, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26,
> > > +=090x27, 0x2d, 0x2e, 0x2a,               0x53, 0x55, 0x54, 0x56,
> > > +=090x2b, 0x14, 0x1a, 0x08, 0x15, 0x17, 0x1c, 0x18, 0x0c, 0x12,
> > > +=090x13, 0x2f, 0x30, 0x31,               0x5f, 0x60, 0x61,
> > > +=090x39, 0x04, 0x16, 0x07, 0x09, 0x0a, 0x0b, 0x0d, 0x0e, 0x0f,
> > > +=090x33, 0x34, 0x28,                     0x5c, 0x5d, 0x5e, 0x57,
> > > +=090xe1, 0x1d, 0x1b, 0x06, 0x19, 0x05, 0x11, 0x10, 0x36, 0x37,
> > > +=090x38, 0xe5, 0x52,                     0x59, 0x5a, 0x5b,
> > > +=090xe0, 0xfe, 0xe3, 0xe2, 0x2c, 0xe6, 0x65, 0xe4, 0x50, 0x51,
> > > +=090x4f,                                 0x62, 0x63, 0x58
> > Why are these aligned in the odd way?
>=20
> to see where the numpad begin to have some kind of orientation
>=20
> 2 rows here are one physical row with the gap in front of the numpad

Okay, thanks.

> > > +static int handle_lamp_array_attributes_report(struct hid_device *hd=
ev,
> > > +=09=09=09=09=09       struct
> > > lamp_array_attributes_report_t *rep)
> > > +{
> > > +=09struct driver_data_t *driver_data =3D hdev->driver_data;
> > > +
> > > +=09rep->lamp_count =3D driver_data->lamp_count;
> > > +=09rep->bounding_box_width_in_micrometers =3D 368000;
> > > +=09rep->bounding_box_height_in_micrometers =3D 266000;
> > > +=09rep->bounding_box_depth_in_micrometers =3D 30000;
> > > +=09// LampArrayKindKeyboard, see "26.2.1 LampArrayKind Values" of "H=
ID
> > > Usage Tables v1.5"
> > Limit length to 80 chars.
>=20
> is this just for comments or also code?
>=20
> because checkpatch explicitly allows 100 chars

For comments. For code you can use longer line lengths where they make=20
sense (doesn't mean that all lines should be tempting that limit which=20
is usually an indication that code should be structured differently).

> > > +=09=09}
> > > +
> > > +=09=09for (int j =3D i + 1; j < rep->lamp_count; ++j) {

The convention these days is to use unsigned int for loop variables that=20
are never supposed to be negative.

> > > +=09=09=09if (rep->lamp_id[i] =3D=3D rep->lamp_id[j]) {
> > > +=09=09=09=09pr_debug("Duplicate lamp_id in
> > > lamp_multi_update_report. Skippng whole report!\n");

Skipping

> > > +=09=09=09=09return sizeof(struct
> > > lamp_multi_update_report_t);
> > > +=09=09=09}
> > > +=09=09}
> > > +=09}
> > > +
> > > +=09for (int i =3D 0; i < rep->lamp_count; ++i) {
> > > +=09=09if (driver_data->keyboard_type =3D=3D
> > > WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII)
> > > +=09=09=09key_id =3D sirius_16_ansii_kbl_mapping[rep->lamp_id[i]];
> > > +=09=09else if (driver_data->keyboard_type =3D=3D
> > > WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO)
> > > +=09=09=09key_id =3D sirius_16_iso_kbl_mapping[rep->lamp_id[i]];
> > > +
> > > +=09=09for (int j =3D 0; j <
> > > WMI_AB_KBL_SET_MULTIPLE_KEYS_LIGHTING_SETTINGS_COUNT_MAX; ++j) {
> > > +=09=09=09key_id_j =3D
> > > next->kbl_set_multiple_keys_input.lighting_settings[j].key_id;
> > > +=09=09=09if (key_id_j =3D=3D 0x00 || key_id_j =3D=3D key_id) {
> > Reverse condition and use continue to lower the indentation level of th=
e
> > main loop body.
> Not sure if this helps with readability, at least for me i think that wou=
ld
> take more time to parse the reversed condition.

?

=09=09=09if (key_id_j !=3D 0x00 && key_id_j !=3D key_id)
=09=09=09=09continue;

The problem is not the condition itself but the indentation level in what=
=20
follows. Lowering that is going to be overall beneficial.

> > > +=09=09=09=09if (key_id_j =3D=3D 0x00)
> > > +
> > > next->kbl_set_multiple_keys_input.lighting_setting_count =3D
> > > +=09=09=09=09=09=09j + 1;

But now that I think of it more, you could also do:
=09=09=09if (key_id_j =3D=3D 0x00)
=09=09=09=09next->... =3D j+1;
=09=09=09else if (key_id_j !=3D key_id)
=09=09=09=09continue;

> > > +
> > > next->kbl_set_multiple_keys_input.lighting_settings[j].key_id =3D
> > > +=09=09=09=09=09key_id;

You could also create local variable for=20
next->kbl_set_multiple_keys_input.lighting_settings[j]
to make this loop body more readable.

Similar local vars might help elsewhere in your code too if you need to do=
=20
repeated accesses deep into the same structure.

> > > +=09=09=09=09// While this driver respects
> > > +=09=09=09=09// intensity_update_channel according to "HID
> > > +=09=09=09=09// Usage Tables v1.5" also on RGB leds, the
> > > +=09=09=09=09// Microsoft MacroPad reference implementation
> > > +=09=09=09=09//
> > > (https://github.com/microsoft/RP2040MacropadHidSample
> > > +=09=09=09=09// 1d6c3ad) does not and ignores it. If it
> > > turns
> > > +=09=09=09=09// out that Windows writes intensity =3D 0 for
> > > RGB
> > > +=09=09=09=09// leds instead of intensity =3D 255, this
> > > driver
> > > +=09=09=09=09// should also irgnore the

ignore

> > > +=09=09=09=09// intensity_update_channel.
> > > +
> > > next->kbl_set_multiple_keys_input.lighting_settings[j].red =3D
> > > +=09=09=09=09=09rep->update_channels[i].red
> > > +=09=09=09=09=09=09*
> > > rep->update_channels[i].intensity / 0xff;
> > > +
> > > next->kbl_set_multiple_keys_input.lighting_settings[j].green =3D
> > > +=09=09=09=09=09rep->update_channels[i].green
> > > +=09=09=09=09=09=09*
> > > rep->update_channels[i].intensity / 0xff;
> > > +
> > > next->kbl_set_multiple_keys_input.lighting_settings[j].blue =3D
> > > +=09=09=09=09=09rep->update_channels[i].blue
> > > +=09=09=09=09=09=09*
> > > rep->update_channels[i].intensity / 0xff;
> > > +
> > > +=09=09=09=09break;
> > > +=09=09=09}
> > > +=09=09}
> > > +=09}
> > > +
> > > +=09if (rep->lamp_update_flags & LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLE=
TE) {
> > > +=09=09ret =3D tuxedo_nb04_wmi_496_b_in_80_b_out(wdev,
> > > WMI_AB_KBL_SET_MULTIPLE_KEYS, next,
> > > +=09=09=09=09=09=09=09&output);
> > > +=09=09memset(next, 0, sizeof(union
> > > tuxedo_nb04_wmi_496_b_in_80_b_out_input));
> > > +=09=09if (ret)
> > > +=09=09=09return ret;
> > > +=09}
> > > +
> > > +=09return sizeof(struct lamp_multi_update_report_t);
> > > +}
> > > +
> > > +
> > > +struct __packed lamp_range_update_report_t {
> > > +=09const uint8_t report_id;
> > > +=09uint8_t lamp_update_flags;
> > > +=09uint16_t lamp_id_start;
> > > +=09uint16_t lamp_id_end;
> > > +=09uint8_t red_update_channel;
> > > +=09uint8_t green_update_channel;
> > > +=09uint8_t blue_update_channel;
> > > +=09uint8_t intensity_update_channel;
> > > +};
> > > +
> > > +static int handle_lamp_range_update_report(struct hid_device *hdev,
> > > +=09=09=09=09=09   struct lamp_range_update_report_t
> > > *report)
> > > +{
> > > +=09struct driver_data_t *driver_data =3D hdev->driver_data;
> > > +=09int ret;
> > > +=09uint8_t lamp_count;
> > > +=09struct lamp_multi_update_report_t lamp_multi_update_report =3D {

No idea why chose to you make the local variable this long as you seem to=
=20
be fine using just "report" for naming the function parameter.

How about taking e.g., the first chars from the words of the time, i.e.,=20
lmur or some similar convention for local names? The type is there close=20
by for the code reader if one needs to know what the chars mean.

> > > +=09=09.report_id =3D LAMP_MULTI_UPDATE_REPORT_ID
> > > +=09};
> > > +
> > > +=09// Catching missformated lamp_range_update_report and fail silent=
ly
> > > according to
> > > +=09// "HID Usage Tables v1.5"
> > > +=09if (report->lamp_id_start > report->lamp_id_end) {
> > > +=09=09pr_debug("lamp_id_start > lamp_id_end in
> > > lamp_range_update_report. Skippng whole report!\n");
> > > +=09=09return sizeof(struct lamp_range_update_report_t);
> > > +=09}
> > > +
> > > +=09if (driver_data->keyboard_type =3D=3D
> > > WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII)
> > > +=09=09lamp_count =3D sizeof(sirius_16_ansii_kbl_mapping);
> > > +=09else if (driver_data->keyboard_type =3D=3D
> > > WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO)
> > > +=09=09lamp_count =3D sizeof(sirius_16_ansii_kbl_mapping);
> > > +
> > > +=09if (report->lamp_id_end > lamp_count - 1) {
> > > +=09=09pr_debug("Out of bounds lamp_id_* in lamp_range_update_report.
> > > Skippng whole report!\n");
> > > +=09=09return sizeof(struct lamp_range_update_report_t);
> > > +=09}
> > > +
> > > +=09// Break handle_lamp_range_update_report call down to multiple
> > > +=09// handle_lamp_multi_update_report calls to easily ensure that mi=
xing
> > > +=09// handle_lamp_range_update_report and handle_lamp_multi_update_r=
eport
> > > +=09// does not break things.
> > > +=09for (int i =3D report->lamp_id_start; i < report->lamp_id_end + 1=
; i =3D i
> > > + 8) {
> > > +=09=09lamp_multi_update_report.lamp_count =3D MIN(report->lamp_id_en=
d
> > > + 1 - i, 8);

Please use min() or min_t() instead of MIN().

> > > +=09=09if (i + lamp_multi_update_report.lamp_count =3D=3D
> > > report->lamp_id_end + 1)
> > > +=09=09=09lamp_multi_update_report.lamp_update_flags |=3D
> > > +=09=09=09=09LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLETE;
> > > +
> > > +=09=09for (int j =3D 0; j < lamp_multi_update_report.lamp_count; ++j=
)
> > > {
> > > +=09=09=09lamp_multi_update_report.lamp_id[j] =3D i + j;
> > > +=09=09=09lamp_multi_update_report.update_channels[j].red =3D
> > > +=09=09=09=09report->red_update_channel;
> > > +=09=09=09lamp_multi_update_report.update_channels[j].green =3D
> > > +=09=09=09=09report->green_update_channel;
> > > +=09=09=09lamp_multi_update_report.update_channels[j].blue =3D
> > > +=09=09=09=09report->blue_update_channel;
> > > +=09=09=09lamp_multi_update_report.update_channels[j].intensity
> > > =3D
> > > +=09=09=09=09report->intensity_update_channel;

Shorter local var name would help here to stay on a single line. If that's=
=20
not enough, local var for lmur->update_channels[j] would help further.

> > > +=09=09}
> > > +
> > > +=09=09ret =3D handle_lamp_multi_update_report(hdev,
> > > &lamp_multi_update_report);
> > > +=09=09if (ret < 0)
> > > +=09=09=09return ret;
> > > +=09=09else if (ret !=3D sizeof(struct lamp_multi_update_report_t))
> > > +=09=09=09return -EIO;
> > > +=09}
> > > +
> > > +=09return sizeof(struct lamp_range_update_report_t);
> > > +}
> > > +
> > > +
> > > +struct __packed lamp_array_control_report_t {
> > > +=09const uint8_t report_id;
> > > +=09uint8_t autonomous_mode;
> > > +};
> > > +
> > > +static int handle_lamp_array_control_report(struct hid_device
> > > __always_unused *hdev,
> > > +=09=09=09=09=09    struct lamp_array_control_report_t
> > > __always_unused *rep)
> > > +{
> > > +=09// The keyboard firmware doesn't have any built in effects or con=
trols
> > > +=09// so this is a NOOP.
> > > +=09// According to the HID Documentation (HID Usage Tables v1.5) thi=
s
> > > +=09// function is optional and can be removed from the HID Report
> > > +=09// Descriptor, but it should first be confirmed that userspace
> > > respects
> > > +=09// this possibility too. The Microsoft MacroPad reference
> > > implementation
> > > +=09// (https://github.com/microsoft/RP2040MacropadHidSample 1d6c3ad)
> > > +=09// already deviates from the spec at another point, see
> > > +=09// handle_lamp_*_update_report.
> > > +
> > > +=09return sizeof(struct lamp_array_control_report_t);
> > > +}
> > > +
> > > +
> > > +static int ll_raw_request(struct hid_device *hdev, unsigned char
> > > reportnum, __u8 *buf, size_t len,
> > > +=09=09=09   unsigned char rtype, int reqtype)
> > > +{
> > > +=09int ret;
> > > +
> > > +=09ret =3D -EINVAL;
> > > +=09if (rtype =3D=3D HID_FEATURE_REPORT) {
> > No, reverse the logic in the condition and return -EINVAL explicitly.
> > It lets you lower the indentation level of the normal path.
>=20
> I don't quite get what you mean, i have to check 3 levels:
>=20
> Feature Report?
>=20
> Get or Set Report?
>=20
> Report ID?
>=20
> I don't see how i can do this without code duplication or 3 levels of
> indendation?

=09if (rtype !=3D HID_FEATURE_REPORT)
=09=09return -EINVAL;

This already brings you down one indentation level and simplifies things=20
as you don't need to do ret =3D -EINVAL + return at the end.

> > > +=09=09if (reqtype =3D=3D HID_REQ_GET_REPORT) {
> > > +=09=09=09if (reportnum =3D=3D LAMP_ARRAY_ATTRIBUTES_REPORT_ID
> > > +=09=09=09    && len =3D=3D sizeof(struct
> > > lamp_array_attributes_report_t))
> > > +=09=09=09=09ret =3D handle_lamp_array_attributes_report(
> > > +=09=09=09=09=09hdev, (struct
> > > lamp_array_attributes_report_t *)buf);
> > > +=09=09=09else if (reportnum =3D=3D
> > > LAMP_ATTRIBUTES_RESPONSE_REPORT_ID
> > > +=09=09=09    && len =3D=3D sizeof(struct
> > > lamp_attributes_response_report_t))
> > > +=09=09=09=09ret =3D handle_lamp_attributes_response_report(
> > > +=09=09=09=09=09hdev, (struct
> > > lamp_attributes_response_report_t *)buf);
> > > +=09=09} else if (reqtype =3D=3D HID_REQ_SET_REPORT) {
> > > +=09=09=09if (reportnum =3D=3D LAMP_ATTRIBUTES_REQUEST_REPORT_ID
> > > +=09=09=09    && len =3D=3D sizeof(struct
> > > lamp_attributes_request_report_t))
> > > +=09=09=09=09ret =3D handle_lamp_attributes_request_report(
> > > +=09=09=09=09=09hdev, (struct
> > > lamp_attributes_request_report_t *)buf);
> > > +=09=09=09else if (reportnum =3D=3D LAMP_MULTI_UPDATE_REPORT_ID
> > > +=09=09=09    && len =3D=3D sizeof(struct
> > > lamp_multi_update_report_t))
> > > +=09=09=09=09ret =3D handle_lamp_multi_update_report(
> > > +=09=09=09=09=09hdev, (struct
> > > lamp_multi_update_report_t *)buf);
> > > +=09=09=09else if (reportnum =3D=3D LAMP_RANGE_UPDATE_REPORT_ID
> > > +=09=09=09    && len =3D=3D sizeof(struct
> > > lamp_range_update_report_t))
> > > +=09=09=09=09ret =3D handle_lamp_range_update_report(
> > > +=09=09=09=09=09hdev, (struct
> > > lamp_range_update_report_t *)buf);
> > > +=09=09=09else if (reportnum =3D=3D LAMP_ARRAY_CONTROL_REPORT_ID
> > > +=09=09=09    && len =3D=3D sizeof(struct
> > > lamp_array_control_report_t))
> > > +=09=09=09=09ret =3D handle_lamp_array_control_report(
> > > +=09=09=09=09=09hdev, (struct
> > > lamp_array_control_report_t *)buf);
> > > +=09=09}
> > This is very messy, and should IMHO use switch&case and directly return
> > -EINVAL on every len check inside the case blocks.
> Wouldn't that mean more intendation? One for the switch case and another =
one
> for the now seperate len check?

No it doesn't add indentation level compared with yours and this is also=20
way easier to read:

=09switch (reqtype) {
=09case HID_REQ_GET_REPORT:
=09=09switch (reportnum) {
=09=09case LAMP_ATTRIBUTES_REQUEST_REPORT_ID:
=09=09=09if (len !=3D sizeof(struct lamp_array_attributes_report_t))
=09=09=09=09return -EINVAL;

=09=09=09return handle_lamp_array_attributes_report(hdev, (struct lamp_arra=
y_attributes_report_t *)buf);
=09=09case ...:
=09=09=09if (len !=3D ...)
=09=09=09=09return -EINVAL;

=09=09=09return ...;
=09=09default:
=09=09=09return -EINVAL;
=09=09}

=09case HID_REQ_SET_REPORT:
=09=09switch (reportnum) {
=09=09case:
=09=09=09...
=09=09default:
=09=09=09return -EINVAL;
=09=09}
=09default:
=09=09return -EINVAL;
=09}
}

Compiler might be stupid enough to require a few additional breaks that=20
will never be reachable + return to the end of function so make those=20
tweaks as needed.

I'm sorry if I copy-pasted something from a wrong place in above but I=20
believe you get the point. The error handling is now clearly visible=20
instead of being build inside a complex if condition and returns=20
immediately to clearly show it's really doing error handling.

> > > +++ b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_arr=
ay.h
> > > @@ -0,0 +1,18 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * This code gives the built in RGB lighting of the TUXEDO NB04 devi=
ces a
> > > + * standardised interface, namely HID LampArray.
> > > + *
> > > + * Copyright (C) 2024 Werner Sembach wse@tuxedocomputers.com
> > > + */
> > > +
> > > +#ifndef TUXEDO_NB04_WMI_AB_VIRTUAL_LAMP_ARRAY_H
> > > +#define TUXEDO_NB04_WMI_AB_VIRTUAL_LAMP_ARRAY_H
> > > +
> > > +#include <linux/wmi.h>
> > > +#include <linux/hid.h>
> > > +
> > > +int tuxedo_nb04_virtual_lamp_array_add_device(struct wmi_device *wde=
v,
> > > +=09=09=09=09=09      struct hid_device **hdev_out);
> > > +
> > > +#endif
> > > diff --git a/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.c
> > > b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.c
> > > new file mode 100644
> > > index 0000000000000..a61b59d225f9f
> > > --- /dev/null
> > > +++ b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.c
> > > @@ -0,0 +1,82 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * This code gives functions to avoid code duplication while interac=
ting
> > > with
> > > + * the TUXEDO NB04 wmi interfaces.
> > > + *
> > > + * Copyright (C) 2024 Werner Sembach wse@tuxedocomputers.com
> > The usual custom is to put <> around email addresses.
> ok
> >=20
> > > + */
> > > +
> > > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > Add all includes for the stuff you use below.
> also linux/wmi.h? or it it enough that that is in the directly associated=
 .h
> file?

I'd prefer to see tham all here even if some "xx.h" does need them itself.
Only if some <yy.h> includes <zz.h> and that dependency is something that=
=20
is pretty much cast into stone, then including just yy.h is enough.

Sadly the include-what-you-use clang tool is not there yet for the kernel=
=20
so it's all manual process currently depending on reviewers paying=20
attention to what headers are missing and which are extra.

> > > +#include "tuxedo_nb04_wmi_ab_init.h"
> > > +
> > > +#include "tuxedo_nb04_wmi_util.h"
> > > +
> > > +static int __wmi_method_acpi_object_out(struct wmi_device *wdev, uin=
t32_t
> > > wmi_method_id,
> > > +=09=09=09=09=09uint8_t *in, acpi_size in_len, union
> > > acpi_object **out)
> > > +{
> > > +=09struct acpi_buffer acpi_buffer_in =3D { in_len, in };
> > > +=09struct acpi_buffer acpi_buffer_out =3D { ACPI_ALLOCATE_BUFFER, NU=
LL };
> > > +
> > > +=09pr_debug("Evaluate WMI method: %u in:\n", wmi_method_id);
> > > +=09print_hex_dump_bytes("", DUMP_PREFIX_OFFSET, in, in_len);
> > > +
> > > +=09acpi_status status =3D wmidev_evaluate_method(wdev, 0, wmi_method=
_id,
> > > &acpi_buffer_in,
> > > +=09=09=09=09=09=09    &acpi_buffer_out);
> > > +=09if (ACPI_FAILURE(status)) {
> > > +=09=09pr_err("Failed to evaluate WMI method.\n");
> > You should use dev_err() instead of pr_err().
> ok
> >=20
> > > +=09=09return -EIO;
> > > +=09}
> > > +=09if (!acpi_buffer_out.pointer) {
> > > +=09=09pr_err("Unexpected empty out buffer.\n");
> > > +=09=09return -ENODATA;
> > > +=09}
> > > +
> > > +=09*out =3D acpi_buffer_out.pointer;
> > > +
> > > +=09return 0;
> > > +}
> > > +
> > > +static int __wmi_method_buffer_out(struct wmi_device *wdev, uint32_t
> > > wmi_method_id, uint8_t *in,
> > > +=09=09=09=09   acpi_size in_len, uint8_t *out, acpi_size
> > > out_len)
> > > +{
> > > +=09int ret;
> > > +=09union acpi_object *acpi_object_out =3D NULL;
> > Reverse xmas tree order.
> ok
> >=20
> > > +
> > > +=09ret =3D __wmi_method_acpi_object_out(wdev, wmi_method_id, in, in_=
len,
> > > &acpi_object_out);
> > > +=09if (ret)
> > > +=09=09return ret;
> > > +
> > > +=09if (acpi_object_out->type !=3D ACPI_TYPE_BUFFER) {
> > > +=09=09pr_err("Unexpected out buffer type. Expected: %u Got: %u\n",
> > > ACPI_TYPE_BUFFER,
> > > +=09=09       acpi_object_out->type);
> > > +=09=09kfree(acpi_object_out);
> > > +=09=09return -EIO;
> > > +=09}
> > > +=09if (acpi_object_out->buffer.length < out_len) {
> > > +=09=09pr_err("Unexpected out buffer length.\n");
> > > +=09=09kfree(acpi_object_out);
> > > +=09=09return -EIO;
> > Duplicated error paths should use goto to handle rollback.
> ok
> >=20
> > > +=09}
> > > +
> > > +=09memcpy(out, acpi_object_out->buffer.pointer, out_len);
> > > +=09kfree(acpi_object_out);
> > > +
> > > +=09return ret;
> > > +}
> > > +
> > > +int tuxedo_nb04_wmi_8_b_in_80_b_out(struct wmi_device *wdev,
> > > +=09=09=09=09    enum
> > > tuxedo_nb04_wmi_8_b_in_80_b_out_methods method,
> > > +=09=09=09=09    union
> > > tuxedo_nb04_wmi_8_b_in_80_b_out_input *input,
> > > +=09=09=09=09    union
> > > tuxedo_nb04_wmi_8_b_in_80_b_out_output *output)
> > > +{
> > > +=09return __wmi_method_buffer_out(wdev, method, input->raw, 8,
> > > output->raw, 80);
> > > +}
> > > +
> > > +int tuxedo_nb04_wmi_496_b_in_80_b_out(struct wmi_device *wdev,
> > > +=09=09=09=09      enum
> > > tuxedo_nb04_wmi_496_b_in_80_b_out_methods method,
> > > +=09=09=09=09      union
> > > tuxedo_nb04_wmi_496_b_in_80_b_out_input *input,
> > > +=09=09=09=09      union
> > > tuxedo_nb04_wmi_496_b_in_80_b_out_output *output)
> > > +{
> > > +=09return __wmi_method_buffer_out(wdev, method, input->raw, 496,
> > > output->raw, 80);
> > > +}
> > > diff --git a/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.h
> > > b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.h
> > > new file mode 100644
> > > index 0000000000000..2765cbe9fcfef
> > > --- /dev/null
> > > +++ b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.h
> > > @@ -0,0 +1,112 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * This code gives functions to avoid code duplication while interac=
ting
> > > with
> > > + * the TUXEDO NB04 wmi interfaces.
> > > + *
> > > + * Copyright (C) 2024 Werner Sembach wse@tuxedocomputers.com
> > > + */
> > > +
> > > +#ifndef TUXEDO_NB04_WMI_UTIL_H
> > > +#define TUXEDO_NB04_WMI_UTIL_H
> > > +
> > > +#include <linux/wmi.h>
> > > +
> > > +#define WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_TOUCHPAD=091
> > > +#define WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_KEYBOARD=092
> > > +#define WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_APP_PAGES=093
> > > +
> > > +#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_NONE=09=090
> > > +#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_PER_KEY=091
> > > +#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_FOUR_ZONE=092
> > > +#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_WHITE_ONLY=093
> > > +
> > > +#define WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII=090
> > > +#define WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO=091
> > > +
> > > +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_RED=09=091
> > > +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_GREEN=09=092
> > > +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_YELLOW=093
> > > +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_BLUE=09=094
> > > +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_PURPLE=095
> > > +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_INDIGO=096
> > > +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_WHITE=09=097
> > > +
> > > +#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_DASHBOARD=09BIT(0)
> > > +#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_SYSTEMINFOS=09BIT(1)
> > > +#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_KBL=09=09BIT(2)
> > > +#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_HOTKEYS=09BIT(3)
> > All these are quite long, I'd consider ways to make them shorter such a=
s:
> >=20
> > DEVICE -> DEV
> > COLOR_ID -> COLOR
> > STATUS -> STS ?
> > KEYBOARD_LAYOUT -> KEY_LAYOUT or KEYBOARD -> KEYB (in general)
> These names match directly internal documentation, if it's no major probl=
em i
> would like to keep the names for future reference.

I kind of assumed it might be the case, won't force you to do the=20
shortening but please realize it will make the code look more messy=20
because of the long line lengths, very long name are harder to read.

> > > +=09struct __packed {
> > Unnecessary packed.
> if it's not harmfull i would like to keep it so I don't forget it when th=
e
> reserved byts might be used sometime int the future

Packed has code generation impact so it is harmful at times.

> > > +=09=09uint8_t device_type;
> > > +=09=09uint8_t reserved_0[7];
> > Why isn't this just reserved[7] ?
> to match the name scheme of the other structs

Does it have to match? These are supposed to be dummy names that just=20
tell don't use/touch this field?

> > > +=09} get_device_status_input;
> > > +};
> > > +
> > > +union tuxedo_nb04_wmi_8_b_in_80_b_out_output {
> > > +=09uint8_t raw[80];
> > > +=09struct __packed {
> > This too looks naturally aligned so packet is unnecessary.
> see above
> >=20
> > > +=09=09uint16_t return_status;
> > > +=09=09uint8_t device_enabled;
> > > +=09=09uint8_t kbl_type;
> > > +=09=09uint8_t kbl_side_bar_supported;
> > > +=09=09uint8_t keyboard_physical_layout;
> > > +=09=09uint8_t app_pages;
> > > +=09=09uint8_t per_key_kbl_default_color;
> > > +=09=09uint8_t four_zone_kbl_default_color_1;
> > > +=09=09uint8_t four_zone_kbl_default_color_2;
> > > +=09=09uint8_t four_zone_kbl_default_color_3;
> > > +=09=09uint8_t four_zone_kbl_default_color_4;
> > > +=09=09uint8_t light_bar_kbl_default_color;
> > > +=09=09uint8_t reserved_0[1];
> > > +=09=09uint16_t dedicated_gpu_id;
> > > +=09=09uint8_t reserved_1[64];
> > > +=09} get_device_status_output;
> > > +};
> > > +
> > > +enum tuxedo_nb04_wmi_8_b_in_80_b_out_methods {
> > > +=09WMI_AB_GET_DEVICE_STATUS=09=3D 2,
> > > +};
> > > +
> > > +
> > > +#define WMI_AB_KBL_SET_MULTIPLE_KEYS_LIGHTING_SETTINGS_COUNT_MAX=091=
20
> > > +
> > > +union tuxedo_nb04_wmi_496_b_in_80_b_out_input {
> > > +=09uint8_t raw[496];
> > > +=09struct __packed {
> > > +=09=09uint8_t reserved_0[15];
> > reserved[15] ?
> see above
> >=20
> > > +=09=09uint8_t lighting_setting_count;
> > > +=09=09struct {
> > > +=09=09=09uint8_t key_id;
> > > +=09=09=09uint8_t red;
> > > +=09=09=09uint8_t green;
> > > +=09=09=09uint8_t blue;
> > > +=09=09}
> > > lighting_settings[WMI_AB_KBL_SET_MULTIPLE_KEYS_LIGHTING_SETTINGS_COUN=
T_MAX];
> > > +=09}  kbl_set_multiple_keys_input;
> > > +};
> > > +
> > > +union tuxedo_nb04_wmi_496_b_in_80_b_out_output {
> > > +=09uint8_t raw[80];
> > > +=09struct __packed {
> > > +=09=09uint8_t return_value;
> > > +=09=09uint8_t reserved_0[79];
> > reserved[79] ?
> see above
> >=20
> > > +=09} kbl_set_multiple_keys_output;
> > > +};
> > > +
> > > +enum tuxedo_nb04_wmi_496_b_in_80_b_out_methods {
> > > +=09WMI_AB_KBL_SET_MULTIPLE_KEYS=09=3D 6,
> > > +};
> > > +
> > > +
> > > +int tuxedo_nb04_wmi_8_b_in_80_b_out(struct wmi_device *wdev,
> > > +=09=09=09=09    enum
> > > tuxedo_nb04_wmi_8_b_in_80_b_out_methods method,
> > > +=09=09=09=09    union
> > > tuxedo_nb04_wmi_8_b_in_80_b_out_input *input,
> > > +=09=09=09=09    union
> > > tuxedo_nb04_wmi_8_b_in_80_b_out_output *output);
> > > +int tuxedo_nb04_wmi_496_b_in_80_b_out(struct wmi_device *wdev,
> > > +=09=09=09=09      enum
> > > tuxedo_nb04_wmi_496_b_in_80_b_out_methods method,
> > > +=09=09=09=09      union
> > > tuxedo_nb04_wmi_496_b_in_80_b_out_input *input,
> > > +=09=09=09=09      union
> > > tuxedo_nb04_wmi_496_b_in_80_b_out_output *output);
> > > +
> > > +#endif
> > There are number of similar cases beyond those I've marked. Please go
> > through all the cases, not just the ones I marked for you.
> >=20
> > My general feel is that this driver is quite heavy to read which is lik=
ely
> > because of what feels excessively long naming used. I'm not convinved
> > being _that verbose_ adds enough value.
>=20
> When it comes down to the wmi structs I named stuff after the internal
> documentation for easy future reference. Everywhere else I shortened the =
names
> for everything that is static, but i can do a second pass.
> >=20
> > E.g., right above you have tuxedo_nb04_wmi_8_b_in_80_b_out_methods whic=
h
> > mostly contains what looks prefix and some sizes. What is the value of
> > having those sizes in the name? It would be much more useful to name
> > things by functionality rather than sizes.
> >=20
> While i currently only implement 2 functions of that wmi api there are mo=
re
> and this interface is written with the intend to be easily expandable to =
the
> other functions in the future.
>=20
> That why i choose the rather generic names of just the input and output l=
ength
> because there is no semantic connection between the wmi methods in
> tuxedo_nb04_wmi_8_b_in_80_b_out and tuxedo_nb04_wmi_496_b_in_80_b_out
> respectively that would make for a good name.

So the only valuable characters are prefix + 8/496/80 the rest doesn't=20
really tell much despite all its characters :-). Details like which of the=
=20
numbers is in/out and that the numbers are in bytes could IMO be left to=20
struct's comment without loss of much information value.

--=20
 i.
--8323328-1514972353-1727951671=:970--
