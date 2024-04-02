Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E425E895FC6
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 00:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5192C11212F;
	Tue,  2 Apr 2024 22:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=pm.me header.i=@pm.me header.b="F1Kn5C61";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D153F10E4CD
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 22:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1712097832; x=1712357032;
 bh=trMcZe8Kca81DGz+C71YrTNCvc3E7JSmP5PWGtCHu/U=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=F1Kn5C614WCQisjsMJFhDyc9fan1niHSvPUg1za6wIStCqtLfu7zKtCSl24utlLps
 oYW0FGqWtikYnMyQFeW9dBL89zasDhhFEHsoJKG7sB18iNnA2BcxCD8DSMSMShpZ2Z
 HnfWM6KBOfV7JmVAV4tSmubBZa/XOFGS7mzZEcNhRv6t+9LbHMTwOSO+y1cjeboJ0Z
 Nzx8eo7uuAFyKVwH1hT6sE1iXNRkjxbNnA4WwZySFrVAc0z0tWWoSI06VA+oQga+Co
 6ERUKrJlQfN6YNwE/QiIp3EzahhI1ap8g6UtUUQFHfOO+fdmMye/ZyRbSD4I8KxGXv
 soFs4Ur2gR6Ig==
Date: Tue, 02 Apr 2024 22:43:48 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
From: Nicolas Devos <ndevos-dev@pm.me>
Cc: Nicolas Devos <ndevos-dev@pm.me>
Subject: [PATCH 4/4] gpu/drm: Replace tabs with spaces in comments
Message-ID: <20240402224320.12146-5-ndevos-dev@pm.me>
In-Reply-To: <20240402224320.12146-1-ndevos-dev@pm.me>
References: <20240402224320.12146-1-ndevos-dev@pm.me>
Feedback-ID: 76711691:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 02 Apr 2024 22:48:59 +0000
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

This commit fixes following warnings found by checkpatch:
WARNING: please, no space before tabs

Signed-off-by: Nicolas Devos <ndevos-dev@pm.me>
---
 drivers/gpu/drm/drm_connector.c | 712 ++++++++++++++++----------------
 1 file changed, 356 insertions(+), 356 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c
index de71805aab2c..d90b9ae6be3c 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1150,70 +1150,70 @@ static const u32 dp_colorspaces =3D
  * DRM connectors have a few standardized properties:
  *
  * EDID:
- * =09Blob property which contains the current EDID read from the sink. Th=
is
- * =09is useful to parse sink identification information like vendor, mode=
l
- * =09and serial. Drivers should update this property by calling
- * =09drm_connector_update_edid_property(), usually after having parsed
- * =09the EDID using drm_add_edid_modes(). Userspace cannot change this
- * =09property.
- *
- * =09User-space should not parse the EDID to obtain information exposed v=
ia
- * =09other KMS properties (because the kernel might apply limits, quirks =
or
- * =09fixups to the EDID). For instance, user-space should not try to pars=
e
- * =09mode lists from the EDID.
+ *      Blob property which contains the current EDID read from the sink. =
This
+ *      is useful to parse sink identification information like vendor, mo=
del
+ *      and serial. Drivers should update this property by calling
+ *      drm_connector_update_edid_property(), usually after having parsed
+ *      the EDID using drm_add_edid_modes(). Userspace cannot change this
+ *      property.
+ *
+ *      User-space should not parse the EDID to obtain information exposed=
 via
+ *      other KMS properties (because the kernel might apply limits, quirk=
s or
+ *      fixups to the EDID). For instance, user-space should not try to pa=
rse
+ *      mode lists from the EDID.
  * DPMS:
- * =09Legacy property for setting the power state of the connector. For at=
omic
- * =09drivers this is only provided for backwards compatibility with exist=
ing
- * =09drivers, it remaps to controlling the "ACTIVE" property on the CRTC =
the
- * =09connector is linked to. Drivers should never set this property direc=
tly,
- * =09it is handled by the DRM core by calling the &drm_connector_funcs.dp=
ms
- * =09callback. For atomic drivers the remapping to the "ACTIVE" property =
is
- * =09implemented in the DRM core.
- *
- * =09Note that this property cannot be set through the MODE_ATOMIC ioctl,
- * =09userspace must use "ACTIVE" on the CRTC instead.
- *
- * =09WARNING:
- *
- * =09For userspace also running on legacy drivers the "DPMS" semantics ar=
e a
- * =09lot more complicated. First, userspace cannot rely on the "DPMS" val=
ue
- * =09returned by the GETCONNECTOR actually reflecting reality, because ma=
ny
- * =09drivers fail to update it. For atomic drivers this is taken care of =
in
- * =09drm_atomic_helper_update_legacy_modeset_state().
- *
- * =09The second issue is that the DPMS state is only well-defined when th=
e
- * =09connector is connected to a CRTC. In atomic the DRM core enforces th=
at
- * =09"ACTIVE" is off in such a case, no such checks exists for "DPMS".
- *
- * =09Finally, when enabling an output using the legacy SETCONFIG ioctl th=
en
- * =09"DPMS" is forced to ON. But see above, that might not be reflected i=
n
- * =09the software value on legacy drivers.
- *
- * =09Summarizing: Only set "DPMS" when the connector is known to be enabl=
ed,
- * =09assume that a successful SETCONFIG call also sets "DPMS" to on, and
- * =09never read back the value of "DPMS" because it can be incorrect.
+ *      Legacy property for setting the power state of the connector. For =
atomic
+ *      drivers this is only provided for backwards compatibility with exi=
sting
+ *      drivers, it remaps to controlling the "ACTIVE" property on the CRT=
C the
+ *      connector is linked to. Drivers should never set this property dir=
ectly,
+ *      it is handled by the DRM core by calling the &drm_connector_funcs.=
dpms
+ *      callback. For atomic drivers the remapping to the "ACTIVE" propert=
y is
+ *      implemented in the DRM core.
+ *
+ *      Note that this property cannot be set through the MODE_ATOMIC ioct=
l,
+ *      userspace must use "ACTIVE" on the CRTC instead.
+ *
+ *      WARNING:
+ *
+ *      For userspace also running on legacy drivers the "DPMS" semantics =
are a
+ *      lot more complicated. First, userspace cannot rely on the "DPMS" v=
alue
+ *      returned by the GETCONNECTOR actually reflecting reality, because =
many
+ *      drivers fail to update it. For atomic drivers this is taken care o=
f in
+ *      drm_atomic_helper_update_legacy_modeset_state().
+ *
+ *      The second issue is that the DPMS state is only well-defined when =
the
+ *      connector is connected to a CRTC. In atomic the DRM core enforces =
that
+ *      "ACTIVE" is off in such a case, no such checks exists for "DPMS".
+ *
+ *      Finally, when enabling an output using the legacy SETCONFIG ioctl =
then
+ *      "DPMS" is forced to ON. But see above, that might not be reflected=
 in
+ *      the software value on legacy drivers.
+ *
+ *      Summarizing: Only set "DPMS" when the connector is known to be ena=
bled,
+ *      assume that a successful SETCONFIG call also sets "DPMS" to on, an=
d
+ *      never read back the value of "DPMS" because it can be incorrect.
  * PATH:
- * =09Connector path property to identify how this sink is physically
- * =09connected. Used by DP MST. This should be set by calling
- * =09drm_connector_set_path_property(), in the case of DP MST with the
- * =09path property the MST manager created. Userspace cannot change this
- * =09property.
- *
- * =09In the case of DP MST, the property has the format
- * =09``mst:<parent>-<ports>`` where ``<parent>`` is the KMS object ID of =
the
- * =09parent connector and ``<ports>`` is a hyphen-separated list of DP MS=
T
- * =09port numbers. Note, KMS object IDs are not guaranteed to be stable
- * =09across reboots.
+ *      Connector path property to identify how this sink is physically
+ *      connected. Used by DP MST. This should be set by calling
+ *      drm_connector_set_path_property(), in the case of DP MST with the
+ *      path property the MST manager created. Userspace cannot change thi=
s
+ *      property.
+ *
+ *      In the case of DP MST, the property has the format
+ *      ``mst:<parent>-<ports>`` where ``<parent>`` is the KMS object ID o=
f the
+ *      parent connector and ``<ports>`` is a hyphen-separated list of DP =
MST
+ *      port numbers. Note, KMS object IDs are not guaranteed to be stable
+ *      across reboots.
  * TILE:
- * =09Connector tile group property to indicate how a set of DRM connector
- * =09compose together into one logical screen. This is used by both high-=
res
- * =09external screens (often only using a single cable, but exposing mult=
iple
- * =09DP MST sinks), or high-res integrated panels (like dual-link DSI) wh=
ich
- * =09are not gen-locked. Note that for tiled panels which are genlocked, =
like
- * =09dual-link LVDS or dual-link DSI, the driver should try to not expose=
 the
- * =09tiling and virtualise both &drm_crtc and &drm_plane if needed. Drive=
rs
- * =09should update this value using drm_connector_set_tile_property().
- * =09Userspace cannot change this property.
+ *      Connector tile group property to indicate how a set of DRM connect=
or
+ *      compose together into one logical screen. This is used by both hig=
h-res
+ *      external screens (often only using a single cable, but exposing mu=
ltiple
+ *      DP MST sinks), or high-res integrated panels (like dual-link DSI) =
which
+ *      are not gen-locked. Note that for tiled panels which are genlocked=
, like
+ *      dual-link LVDS or dual-link DSI, the driver should try to not expo=
se the
+ *      tiling and virtualise both &drm_crtc and &drm_plane if needed. Dri=
vers
+ *      should update this value using drm_connector_set_tile_property().
+ *      Userspace cannot change this property.
  * link-status:
  *      Connector link-status property to indicate the status of link. The
  *      default value of link-status is "GOOD". If something fails during =
or
@@ -1247,258 +1247,258 @@ static const u32 dp_colorspaces =3D
  *      to how it might fail if a different screen has been connected in t=
he
  *      interim.
  * non_desktop:
- * =09Indicates the output should be ignored for purposes of displaying a
- * =09standard desktop environment or console. This is most likely because
- * =09the output device is not rectilinear.
+ *      Indicates the output should be ignored for purposes of displaying =
a
+ *      standard desktop environment or console. This is most likely becau=
se
+ *      the output device is not rectilinear.
  * Content Protection:
- *=09This property is used by userspace to request the kernel protect futu=
re
- *=09content communicated over the link. When requested, kernel will apply
- *=09the appropriate means of protection (most often HDCP), and use the
- *=09property to tell userspace the protection is active.
- *
- *=09Drivers can set this up by calling
- *=09drm_connector_attach_content_protection_property() on initialization.
- *
- *=09The value of this property can be one of the following:
- *
- *=09DRM_MODE_CONTENT_PROTECTION_UNDESIRED =3D 0
- *=09=09The link is not protected, content is transmitted in the clear.
- *=09DRM_MODE_CONTENT_PROTECTION_DESIRED =3D 1
- *=09=09Userspace has requested content protection, but the link is not
- *=09=09currently protected. When in this state, kernel should enable
- *=09=09Content Protection as soon as possible.
- *=09DRM_MODE_CONTENT_PROTECTION_ENABLED =3D 2
- *=09=09Userspace has requested content protection, and the link is
- *=09=09protected. Only the driver can set the property to this value.
- *=09=09If userspace attempts to set to ENABLED, kernel will return
- *=09=09-EINVAL.
- *
- *=09A few guidelines:
- *
- *=09- DESIRED state should be preserved until userspace de-asserts it by
- *=09  setting the property to UNDESIRED. This means ENABLED should only
- *=09  transition to UNDESIRED when the user explicitly requests it.
- *=09- If the state is DESIRED, kernel should attempt to re-authenticate t=
he
- *=09  link whenever possible. This includes across disable/enable, dpms,
- *=09  hotplug, downstream device changes, link status failures, etc..
- *=09- Kernel sends uevent with the connector id and property id through
- *=09  @drm_hdcp_update_content_protection, upon below kernel triggered
- *=09  scenarios:
- *
- *=09=09- DESIRED -> ENABLED (authentication success)
- *=09=09- ENABLED -> DESIRED (termination of authentication)
- *=09- Please note no uevents for userspace triggered property state chang=
es,
- *=09  which can't fail such as
- *
- *=09=09- DESIRED/ENABLED -> UNDESIRED
- *=09=09- UNDESIRED -> DESIRED
- *=09- Userspace is responsible for polling the property or listen to ueve=
nts
- *=09  to determine when the value transitions from ENABLED to DESIRED.
- *=09  This signifies the link is no longer protected and userspace should
- *=09  take appropriate action (whatever that might be).
+ *      This property is used by userspace to request the kernel protect f=
uture
+ *      content communicated over the link. When requested, kernel will ap=
ply
+ *      the appropriate means of protection (most often HDCP), and use the
+ *      property to tell userspace the protection is active.
+ *
+ *      Drivers can set this up by calling
+ *      drm_connector_attach_content_protection_property() on initializati=
on.
+ *
+ *      The value of this property can be one of the following:
+ *
+ *      DRM_MODE_CONTENT_PROTECTION_UNDESIRED =3D 0
+ *              The link is not protected, content is transmitted in the c=
lear.
+ *      DRM_MODE_CONTENT_PROTECTION_DESIRED =3D 1
+ *              Userspace has requested content protection, but the link i=
s not
+ *              currently protected. When in this state, kernel should ena=
ble
+ *              Content Protection as soon as possible.
+ *      DRM_MODE_CONTENT_PROTECTION_ENABLED =3D 2
+ *              Userspace has requested content protection, and the link i=
s
+ *              protected. Only the driver can set the property to this va=
lue.
+ *              If userspace attempts to set to ENABLED, kernel will retur=
n
+ *              -EINVAL.
+ *
+ *      A few guidelines:
+ *
+ *      - DESIRED state should be preserved until userspace de-asserts it =
by
+ *        setting the property to UNDESIRED. This means ENABLED should onl=
y
+ *        transition to UNDESIRED when the user explicitly requests it.
+ *      - If the state is DESIRED, kernel should attempt to re-authenticat=
e the
+ *        link whenever possible. This includes across disable/enable, dpm=
s,
+ *        hotplug, downstream device changes, link status failures, etc..
+ *      - Kernel sends uevent with the connector id and property id throug=
h
+ *        @drm_hdcp_update_content_protection, upon below kernel triggered
+ *        scenarios:
+ *
+ *              - DESIRED -> ENABLED (authentication success)
+ *              - ENABLED -> DESIRED (termination of authentication)
+ *      - Please note no uevents for userspace triggered property state ch=
anges,
+ *        which can't fail such as
+ *
+ *              - DESIRED/ENABLED -> UNDESIRED
+ *              - UNDESIRED -> DESIRED
+ *      - Userspace is responsible for polling the property or listen to u=
events
+ *        to determine when the value transitions from ENABLED to DESIRED.
+ *        This signifies the link is no longer protected and userspace sho=
uld
+ *        take appropriate action (whatever that might be).
  *
  * HDCP Content Type:
- *=09This Enum property is used by the userspace to declare the content ty=
pe
- *=09of the display stream, to kernel. Here display stream stands for any
- *=09display content that userspace intended to display through HDCP
- *=09encryption.
- *
- *=09Content Type of a stream is decided by the owner of the stream, as
- *=09"HDCP Type0" or "HDCP Type1".
- *
- *=09The value of the property can be one of the below:
- *=09  - "HDCP Type0": DRM_MODE_HDCP_CONTENT_TYPE0 =3D 0
- *=09  - "HDCP Type1": DRM_MODE_HDCP_CONTENT_TYPE1 =3D 1
- *
- *=09When kernel starts the HDCP authentication (see "Content Protection"
- *=09for details), it uses the content type in "HDCP Content Type"
- *=09for performing the HDCP authentication with the display sink.
- *
- *=09Please note in HDCP spec versions, a link can be authenticated with
- *=09HDCP 2.2 for Content Type 0/Content Type 1. Where as a link can be
- *=09authenticated with HDCP1.4 only for Content Type 0(though it is impli=
cit
- *=09in nature. As there is no reference for Content Type in HDCP1.4).
- *
- *=09HDCP2.2 authentication protocol itself takes the "Content Type" as a
- *=09parameter, which is a input for the DP HDCP2.2 encryption algo.
- *
- *=09In case of Type 0 content protection request, kernel driver can choos=
e
- *=09either of HDCP spec versions 1.4 and 2.2. When HDCP2.2 is used for
- *=09"HDCP Type 0", a HDCP 2.2 capable repeater in the downstream can send
- *=09that content to a HDCP 1.4 authenticated HDCP sink (Type0 link).
- *=09But if the content is classified as "HDCP Type 1", above mentioned
- *=09HDCP 2.2 repeater wont send the content to the HDCP sink as it can't
- *=09authenticate the HDCP1.4 capable sink for "HDCP Type 1".
- *
- *=09Please note userspace can be ignorant of the HDCP versions used by th=
e
- *=09kernel driver to achieve the "HDCP Content Type".
- *
- *=09At current scenario, classifying a content as Type 1 ensures that the
- *=09content will be displayed only through the HDCP2.2 encrypted link.
- *
- *=09Note that the HDCP Content Type property is introduced at HDCP 2.2, a=
nd
- *=09defaults to type 0. It is only exposed by drivers supporting HDCP 2.2
- *=09(hence supporting Type 0 and Type 1). Based on how next versions of
- *=09HDCP specs are defined content Type could be used for higher versions
- *=09too.
- *
- *=09If content type is changed when "Content Protection" is not UNDESIRED=
,
- *=09then kernel will disable the HDCP and re-enable with new type in the
- *=09same atomic commit. And when "Content Protection" is ENABLED, it mean=
s
- *=09that link is HDCP authenticated and encrypted, for the transmission o=
f
- *=09the Type of stream mentioned at "HDCP Content Type".
+ *      This Enum property is used by the userspace to declare the content=
 type
+ *      of the display stream, to kernel. Here display stream stands for a=
ny
+ *      display content that userspace intended to display through HDCP
+ *      encryption.
+ *
+ *      Content Type of a stream is decided by the owner of the stream, as
+ *      "HDCP Type0" or "HDCP Type1".
+ *
+ *      The value of the property can be one of the below:
+ *        - "HDCP Type0": DRM_MODE_HDCP_CONTENT_TYPE0 =3D 0
+ *        - "HDCP Type1": DRM_MODE_HDCP_CONTENT_TYPE1 =3D 1
+ *
+ *      When kernel starts the HDCP authentication (see "Content Protectio=
n"
+ *      for details), it uses the content type in "HDCP Content Type"
+ *      for performing the HDCP authentication with the display sink.
+ *
+ *      Please note in HDCP spec versions, a link can be authenticated wit=
h
+ *      HDCP 2.2 for Content Type 0/Content Type 1. Where as a link can be
+ *      authenticated with HDCP1.4 only for Content Type 0(though it is im=
plicit
+ *      in nature. As there is no reference for Content Type in HDCP1.4).
+ *
+ *      HDCP2.2 authentication protocol itself takes the "Content Type" as=
 a
+ *      parameter, which is a input for the DP HDCP2.2 encryption algo.
+ *
+ *      In case of Type 0 content protection request, kernel driver can ch=
oose
+ *      either of HDCP spec versions 1.4 and 2.2. When HDCP2.2 is used for
+ *      "HDCP Type 0", a HDCP 2.2 capable repeater in the downstream can s=
end
+ *      that content to a HDCP 1.4 authenticated HDCP sink (Type0 link).
+ *      But if the content is classified as "HDCP Type 1", above mentioned
+ *      HDCP 2.2 repeater wont send the content to the HDCP sink as it can=
't
+ *      authenticate the HDCP1.4 capable sink for "HDCP Type 1".
+ *
+ *      Please note userspace can be ignorant of the HDCP versions used by=
 the
+ *      kernel driver to achieve the "HDCP Content Type".
+ *
+ *      At current scenario, classifying a content as Type 1 ensures that =
the
+ *      content will be displayed only through the HDCP2.2 encrypted link.
+ *
+ *      Note that the HDCP Content Type property is introduced at HDCP 2.2=
, and
+ *      defaults to type 0. It is only exposed by drivers supporting HDCP =
2.2
+ *      (hence supporting Type 0 and Type 1). Based on how next versions o=
f
+ *      HDCP specs are defined content Type could be used for higher versi=
ons
+ *      too.
+ *
+ *      If content type is changed when "Content Protection" is not UNDESI=
RED,
+ *      then kernel will disable the HDCP and re-enable with new type in t=
he
+ *      same atomic commit. And when "Content Protection" is ENABLED, it m=
eans
+ *      that link is HDCP authenticated and encrypted, for the transmissio=
n of
+ *      the Type of stream mentioned at "HDCP Content Type".
  *
  * HDR_OUTPUT_METADATA:
- *=09Connector property to enable userspace to send HDR Metadata to
- *=09driver. This metadata is based on the composition and blending
- *=09policies decided by user, taking into account the hardware and
- *=09sink capabilities. The driver gets this metadata and creates a
- *=09Dynamic Range and Mastering Infoframe (DRM) in case of HDMI,
- *=09SDP packet (Non-audio INFOFRAME SDP v1.3) for DP. This is then
- *=09sent to sink. This notifies the sink of the upcoming frame's Color
- *=09Encoding and Luminance parameters.
- *
- *=09Userspace first need to detect the HDR capabilities of sink by
- *=09reading and parsing the EDID. Details of HDR metadata for HDMI
- *=09are added in CTA 861.G spec. For DP , its defined in VESA DP
- *=09Standard v1.4. It needs to then get the metadata information
- *=09of the video/game/app content which are encoded in HDR (basically
- *=09using HDR transfer functions). With this information it needs to
- *=09decide on a blending policy and compose the relevant
- *=09layers/overlays into a common format. Once this blending is done,
- *=09userspace will be aware of the metadata of the composed frame to
- *=09be send to sink. It then uses this property to communicate this
- *=09metadata to driver which then make a Infoframe packet and sends
- *=09to sink based on the type of encoder connected.
- *
- *=09Userspace will be responsible to do Tone mapping operation in case:
- *=09=09- Some layers are HDR and others are SDR
- *=09=09- HDR layers luminance is not same as sink
- *
- *=09It will even need to do colorspace conversion and get all layers
- *=09to one common colorspace for blending. It can use either GL, Media
- *=09or display engine to get this done based on the capabilities of the
- *=09associated hardware.
- *
- *=09Driver expects metadata to be put in &struct hdr_output_metadata
- *=09structure from userspace. This is received as blob and stored in
- *=09&drm_connector_state.hdr_output_metadata. It parses EDID and saves th=
e
- *=09sink metadata in &struct hdr_sink_metadata, as
- *=09&drm_connector.hdr_sink_metadata.  Driver uses
- *=09drm_hdmi_infoframe_set_hdr_metadata() helper to set the HDR metadata,
- *=09hdmi_drm_infoframe_pack() to pack the infoframe as per spec, in case =
of
- *=09HDMI encoder.
+ *      Connector property to enable userspace to send HDR Metadata to
+ *      driver. This metadata is based on the composition and blending
+ *      policies decided by user, taking into account the hardware and
+ *      sink capabilities. The driver gets this metadata and creates a
+ *      Dynamic Range and Mastering Infoframe (DRM) in case of HDMI,
+ *      SDP packet (Non-audio INFOFRAME SDP v1.3) for DP. This is then
+ *      sent to sink. This notifies the sink of the upcoming frame's Color
+ *      Encoding and Luminance parameters.
+ *
+ *      Userspace first need to detect the HDR capabilities of sink by
+ *      reading and parsing the EDID. Details of HDR metadata for HDMI
+ *      are added in CTA 861.G spec. For DP , its defined in VESA DP
+ *      Standard v1.4. It needs to then get the metadata information
+ *      of the video/game/app content which are encoded in HDR (basically
+ *      using HDR transfer functions). With this information it needs to
+ *      decide on a blending policy and compose the relevant
+ *      layers/overlays into a common format. Once this blending is done,
+ *      userspace will be aware of the metadata of the composed frame to
+ *      be send to sink. It then uses this property to communicate this
+ *      metadata to driver which then make a Infoframe packet and sends
+ *      to sink based on the type of encoder connected.
+ *
+ *      Userspace will be responsible to do Tone mapping operation in case=
:
+ *              - Some layers are HDR and others are SDR
+ *              - HDR layers luminance is not same as sink
+ *
+ *      It will even need to do colorspace conversion and get all layers
+ *      to one common colorspace for blending. It can use either GL, Media
+ *      or display engine to get this done based on the capabilities of th=
e
+ *      associated hardware.
+ *
+ *      Driver expects metadata to be put in &struct hdr_output_metadata
+ *      structure from userspace. This is received as blob and stored in
+ *      &drm_connector_state.hdr_output_metadata. It parses EDID and saves=
 the
+ *      sink metadata in &struct hdr_sink_metadata, as
+ *      &drm_connector.hdr_sink_metadata.  Driver uses
+ *      drm_hdmi_infoframe_set_hdr_metadata() helper to set the HDR metada=
ta,
+ *      hdmi_drm_infoframe_pack() to pack the infoframe as per spec, in ca=
se of
+ *      HDMI encoder.
  *
  * max bpc:
- *=09This range property is used by userspace to limit the bit depth. When
- *=09used the driver would limit the bpc in accordance with the valid rang=
e
- *=09supported by the hardware and sink. Drivers to use the function
- *=09drm_connector_attach_max_bpc_property() to create and attach the
- *=09property to the connector during initialization.
+ *      This range property is used by userspace to limit the bit depth. W=
hen
+ *      used the driver would limit the bpc in accordance with the valid r=
ange
+ *      supported by the hardware and sink. Drivers to use the function
+ *      drm_connector_attach_max_bpc_property() to create and attach the
+ *      property to the connector during initialization.
  *
  * Connectors also have one standardized atomic property:
  *
  * CRTC_ID:
- * =09Mode object ID of the &drm_crtc this connector should be connected t=
o.
+ *      Mode object ID of the &drm_crtc this connector should be connected=
 to.
  *
  * Connectors for LCD panels may also have one standardized property:
  *
  * panel orientation:
- *=09On some devices the LCD panel is mounted in the casing in such a way
- *=09that the up/top side of the panel does not match with the top side of
- *=09the device. Userspace can use this property to check for this.
- *=09Note that input coordinates from touchscreens (input devices with
- *=09INPUT_PROP_DIRECT) will still map 1:1 to the actual LCD panel
- *=09coordinates, so if userspace rotates the picture to adjust for
- *=09the orientation it must also apply the same transformation to the
- *=09touchscreen input coordinates. This property is initialized by callin=
g
- *=09drm_connector_set_panel_orientation() or
- *=09drm_connector_set_panel_orientation_with_quirk()
+ *      On some devices the LCD panel is mounted in the casing in such a w=
ay
+ *      that the up/top side of the panel does not match with the top side=
 of
+ *      the device. Userspace can use this property to check for this.
+ *      Note that input coordinates from touchscreens (input devices with
+ *      INPUT_PROP_DIRECT) will still map 1:1 to the actual LCD panel
+ *      coordinates, so if userspace rotates the picture to adjust for
+ *      the orientation it must also apply the same transformation to the
+ *      touchscreen input coordinates. This property is initialized by cal=
ling
+ *      drm_connector_set_panel_orientation() or
+ *      drm_connector_set_panel_orientation_with_quirk()
  *
  * scaling mode:
- *=09This property defines how a non-native mode is upscaled to the native
- *=09mode of an LCD panel:
- *
- *=09None:
- *=09=09No upscaling happens, scaling is left to the panel. Not all
- *=09=09drivers expose this mode.
- *=09Full:
- *=09=09The output is upscaled to the full resolution of the panel,
- *=09=09ignoring the aspect ratio.
- *=09Center:
- *=09=09No upscaling happens, the output is centered within the native
- *=09=09resolution the panel.
- *=09Full aspect:
- *=09=09The output is upscaled to maximize either the width or height
- *=09=09while retaining the aspect ratio.
- *
- *=09This property should be set up by calling
- *=09drm_connector_attach_scaling_mode_property(). Note that drivers
- *=09can also expose this property to external outputs, in which case they
- *=09must support "None", which should be the default (since external scre=
ens
- *=09have a built-in scaler).
+ *      This property defines how a non-native mode is upscaled to the nat=
ive
+ *      mode of an LCD panel:
+ *
+ *      None:
+ *              No upscaling happens, scaling is left to the panel. Not al=
l
+ *              drivers expose this mode.
+ *      Full:
+ *              The output is upscaled to the full resolution of the panel=
,
+ *              ignoring the aspect ratio.
+ *      Center:
+ *              No upscaling happens, the output is centered within the na=
tive
+ *              resolution the panel.
+ *      Full aspect:
+ *              The output is upscaled to maximize either the width or hei=
ght
+ *              while retaining the aspect ratio.
+ *
+ *      This property should be set up by calling
+ *      drm_connector_attach_scaling_mode_property(). Note that drivers
+ *      can also expose this property to external outputs, in which case t=
hey
+ *      must support "None", which should be the default (since external s=
creens
+ *      have a built-in scaler).
  *
  * subconnector:
- *=09This property is used by DVI-I, TVout and DisplayPort to indicate dif=
ferent
- *=09connector subtypes. Enum values more or less match with those from ma=
in
- *=09connector types.
- *=09For DVI-I and TVout there is also a matching property "select subconn=
ector"
- *=09allowing to switch between signal types.
- *=09DP subconnector corresponds to a downstream port.
+ *      This property is used by DVI-I, TVout and DisplayPort to indicate =
different
+ *      connector subtypes. Enum values more or less match with those from=
 main
+ *      connector types.
+ *      For DVI-I and TVout there is also a matching property "select subc=
onnector"
+ *      allowing to switch between signal types.
+ *      DP subconnector corresponds to a downstream port.
  *
  * privacy-screen sw-state, privacy-screen hw-state:
- *=09These 2 optional properties can be used to query the state of the
- *=09electronic privacy screen that is available on some displays; and in
- *=09some cases also control the state. If a driver implements these
- *=09properties then both properties must be present.
- *
- *=09"privacy-screen hw-state" is read-only and reflects the actual state
- *=09of the privacy-screen, possible values: "Enabled", "Disabled,
- *=09"Enabled-locked", "Disabled-locked". The locked states indicate
- *=09that the state cannot be changed through the DRM API. E.g. there
- *=09might be devices where the firmware-setup options, or a hardware
- *=09slider-switch, offer always on / off modes.
- *
- *=09"privacy-screen sw-state" can be set to change the privacy-screen sta=
te
- *=09when not locked. In this case the driver must update the hw-state
- *=09property to reflect the new state on completion of the commit of the
- *=09sw-state property. Setting the sw-state property when the hw-state is
- *=09locked must be interpreted by the driver as a request to change the
- *=09state to the set state when the hw-state becomes unlocked. E.g. if
- *=09"privacy-screen hw-state" is "Enabled-locked" and the sw-state
- *=09gets set to "Disabled" followed by the user unlocking the state by
- *=09changing the slider-switch position, then the driver must set the
- *=09state to "Disabled" upon receiving the unlock event.
- *
- *=09In some cases the privacy-screen's actual state might change outside =
of
- *=09control of the DRM code. E.g. there might be a firmware handled hotke=
y
- *=09which toggles the actual state, or the actual state might be changed
- *=09through another userspace API such as writing /proc/acpi/ibm/lcdshado=
w.
- *=09In this case the driver must update both the hw-state and the sw-stat=
e
- *=09to reflect the new value, overwriting any pending state requests in t=
he
- *=09sw-state. Any pending sw-state requests are thus discarded.
- *
- *=09Note that the ability for the state to change outside of control of
- *=09the DRM master process means that userspace must not cache the value
- *=09of the sw-state. Caching the sw-state value and including it in later
- *=09atomic commits may lead to overriding a state change done through e.g=
.
- *=09a firmware handled hotkey. Therefor userspace must not include the
- *=09privacy-screen sw-state in an atomic commit unless it wants to change
- *=09its value.
+ *      These 2 optional properties can be used to query the state of the
+ *      electronic privacy screen that is available on some displays; and =
in
+ *      some cases also control the state. If a driver implements these
+ *      properties then both properties must be present.
+ *
+ *      "privacy-screen hw-state" is read-only and reflects the actual sta=
te
+ *      of the privacy-screen, possible values: "Enabled", "Disabled,
+ *      "Enabled-locked", "Disabled-locked". The locked states indicate
+ *      that the state cannot be changed through the DRM API. E.g. there
+ *      might be devices where the firmware-setup options, or a hardware
+ *      slider-switch, offer always on / off modes.
+ *
+ *      "privacy-screen sw-state" can be set to change the privacy-screen =
state
+ *      when not locked. In this case the driver must update the hw-state
+ *      property to reflect the new state on completion of the commit of t=
he
+ *      sw-state property. Setting the sw-state property when the hw-state=
 is
+ *      locked must be interpreted by the driver as a request to change th=
e
+ *      state to the set state when the hw-state becomes unlocked. E.g. if
+ *      "privacy-screen hw-state" is "Enabled-locked" and the sw-state
+ *      gets set to "Disabled" followed by the user unlocking the state by
+ *      changing the slider-switch position, then the driver must set the
+ *      state to "Disabled" upon receiving the unlock event.
+ *
+ *      In some cases the privacy-screen's actual state might change outsi=
de of
+ *      control of the DRM code. E.g. there might be a firmware handled ho=
tkey
+ *      which toggles the actual state, or the actual state might be chang=
ed
+ *      through another userspace API such as writing /proc/acpi/ibm/lcdsh=
adow.
+ *      In this case the driver must update both the hw-state and the sw-s=
tate
+ *      to reflect the new value, overwriting any pending state requests i=
n the
+ *      sw-state. Any pending sw-state requests are thus discarded.
+ *
+ *      Note that the ability for the state to change outside of control o=
f
+ *      the DRM master process means that userspace must not cache the val=
ue
+ *      of the sw-state. Caching the sw-state value and including it in la=
ter
+ *      atomic commits may lead to overriding a state change done through =
e.g.
+ *      a firmware handled hotkey. Therefor userspace must not include the
+ *      privacy-screen sw-state in an atomic commit unless it wants to cha=
nge
+ *      its value.
  *
  * left margin, right margin, top margin, bottom margin:
- *=09Add margins to the connector's viewport. This is typically used to
- *=09mitigate overscan on TVs.
+ *      Add margins to the connector's viewport. This is typically used to
+ *      mitigate overscan on TVs.
  *
- *=09The value is the size in pixels of the black border which will be
- *=09added. The attached CRTC's content will be scaled to fill the whole
- *=09area inside the margin.
+ *      The value is the size in pixels of the black border which will be
+ *      added. The attached CRTC's content will be scaled to fill the whol=
e
+ *      area inside the margin.
  *
- *=09The margins configuration might be sent to the sink, e.g. via HDMI AV=
I
- *=09InfoFrames.
+ *      The margins configuration might be sent to the sink, e.g. via HDMI=
 AVI
+ *      InfoFrames.
  *
- *=09Drivers can set up these properties by calling
- *=09drm_mode_create_tv_margin_properties().
+ *      Drivers can set up these properties by calling
+ *      drm_mode_create_tv_margin_properties().
  */
=20
 int drm_connector_create_standard_properties(struct drm_device *dev)
@@ -1617,28 +1617,28 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_=
property);
  * DOC: HDMI connector properties
  *
  * content type (HDMI specific):
- *=09Indicates content type setting to be used in HDMI infoframes to indic=
ate
- *=09content type for the external device, so that it adjusts its display
- *=09settings accordingly.
+ *      Indicates content type setting to be used in HDMI infoframes to in=
dicate
+ *      content type for the external device, so that it adjusts its displ=
ay
+ *      settings accordingly.
  *
- *=09The value of this property can be one of the following:
+ *      The value of this property can be one of the following:
  *
- *=09No Data:
- *=09=09Content type is unknown
- *=09Graphics:
- *=09=09Content type is graphics
- *=09Photo:
- *=09=09Content type is photo
- *=09Cinema:
- *=09=09Content type is cinema
- *=09Game:
- *=09=09Content type is game
+ *      No Data:
+ *              Content type is unknown
+ *      Graphics:
+ *              Content type is graphics
+ *      Photo:
+ *              Content type is photo
+ *      Cinema:
+ *              Content type is cinema
+ *      Game:
+ *              Content type is game
  *
- *=09The meaning of each content type is defined in CTA-861-G table 15.
+ *      The meaning of each content type is defined in CTA-861-G table 15.
  *
- *=09Drivers can set up this property by calling
- *=09drm_connector_attach_content_type_property(). Decoding to
- *=09infoframe values is done through drm_hdmi_avi_infoframe_content_type(=
).
+ *      Drivers can set up this property by calling
+ *      drm_connector_attach_content_type_property(). Decoding to
+ *      infoframe values is done through drm_hdmi_avi_infoframe_content_ty=
pe().
  */
=20
 /*
@@ -1656,49 +1656,49 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_=
property);
  * DOC: Analog TV Connector Properties
  *
  * TV Mode:
- *=09Indicates the TV Mode used on an analog TV connector. The value
- *=09of this property can be one of the following:
+ *      Indicates the TV Mode used on an analog TV connector. The value
+ *      of this property can be one of the following:
  *
- *=09NTSC:
- *=09=09TV Mode is CCIR System M (aka 525-lines) together with
- *=09=09the NTSC Color Encoding.
+ *      NTSC:
+ *              TV Mode is CCIR System M (aka 525-lines) together with
+ *              the NTSC Color Encoding.
  *
- *=09NTSC-443:
+ *      NTSC-443:
  *
- *=09=09TV Mode is CCIR System M (aka 525-lines) together with
- *=09=09the NTSC Color Encoding, but with a color subcarrier
- *=09=09frequency of 4.43MHz
+ *              TV Mode is CCIR System M (aka 525-lines) together with
+ *              the NTSC Color Encoding, but with a color subcarrier
+ *              frequency of 4.43MHz
  *
- *=09NTSC-J:
+ *      NTSC-J:
  *
- *=09=09TV Mode is CCIR System M (aka 525-lines) together with
- *=09=09the NTSC Color Encoding, but with a black level equal to
- *=09=09the blanking level.
+ *              TV Mode is CCIR System M (aka 525-lines) together with
+ *              the NTSC Color Encoding, but with a black level equal to
+ *              the blanking level.
  *
- *=09PAL:
+ *      PAL:
  *
- *=09=09TV Mode is CCIR System B (aka 625-lines) together with
- *=09=09the PAL Color Encoding.
+ *              TV Mode is CCIR System B (aka 625-lines) together with
+ *              the PAL Color Encoding.
  *
- *=09PAL-M:
+ *      PAL-M:
  *
- *=09=09TV Mode is CCIR System M (aka 525-lines) together with
- *=09=09the PAL Color Encoding.
+ *              TV Mode is CCIR System M (aka 525-lines) together with
+ *              the PAL Color Encoding.
  *
- *=09PAL-N:
+ *      PAL-N:
  *
- *=09=09TV Mode is CCIR System N together with the PAL Color
- *=09=09Encoding, a color subcarrier frequency of 3.58MHz, the
- *=09=09SECAM color space, and narrower channels than other PAL
- *=09=09variants.
+ *              TV Mode is CCIR System N together with the PAL Color
+ *              Encoding, a color subcarrier frequency of 3.58MHz, the
+ *              SECAM color space, and narrower channels than other PAL
+ *              variants.
  *
- *=09SECAM:
+ *      SECAM:
  *
- *=09=09TV Mode is CCIR System B (aka 625-lines) together with
- *=09=09the SECAM Color Encoding.
+ *              TV Mode is CCIR System B (aka 625-lines) together with
+ *              the SECAM Color Encoding.
  *
- *=09Drivers can set up this property by calling
- *=09drm_mode_create_tv_properties().
+ *      Drivers can set up this property by calling
+ *      drm_mode_create_tv_properties().
  */
=20
 /**
@@ -1721,7 +1721,7 @@ EXPORT_SYMBOL(drm_connector_attach_content_type_prope=
rty);
=20
 /**
  * drm_connector_attach_tv_margin_properties - attach TV connector margin
- * =09properties
+ *      properties
  * @connector: DRM connector
  *
  * Called by a driver when it needs to attach TV margin props to a connect=
or.
@@ -1998,31 +1998,31 @@ EXPORT_SYMBOL(drm_mode_create_scaling_mode_property=
);
  * on the &drm_connector and &drm_crtc objects.
  *
  * "vrr_capable":
- *=09Optional &drm_connector boolean property that drivers should attach
- *=09with drm_connector_attach_vrr_capable_property() on connectors that
- *=09could support variable refresh rates. Drivers should update the
- *=09property value by calling drm_connector_set_vrr_capable_property().
+ *      Optional &drm_connector boolean property that drivers should attac=
h
+ *      with drm_connector_attach_vrr_capable_property() on connectors tha=
t
+ *      could support variable refresh rates. Drivers should update the
+ *      property value by calling drm_connector_set_vrr_capable_property()=
.
  *
- *=09Absence of the property should indicate absence of support.
+ *      Absence of the property should indicate absence of support.
  *
  * "VRR_ENABLED":
- *=09Default &drm_crtc boolean property that notifies the driver that the
- *=09content on the CRTC is suitable for variable refresh rate presentatio=
n.
- *=09The driver will take this property as a hint to enable variable
- *=09refresh rate support if the receiver supports it, ie. if the
- *=09"vrr_capable" property is true on the &drm_connector object. The
- *=09vertical front porch duration will be extended until page-flip or
- *=09timeout when enabled.
+ *      Default &drm_crtc boolean property that notifies the driver that t=
he
+ *      content on the CRTC is suitable for variable refresh rate presenta=
tion.
+ *      The driver will take this property as a hint to enable variable
+ *      refresh rate support if the receiver supports it, ie. if the
+ *      "vrr_capable" property is true on the &drm_connector object. The
+ *      vertical front porch duration will be extended until page-flip or
+ *      timeout when enabled.
  *
- *=09The minimum vertical front porch duration is defined as the vertical
- *=09front porch duration for the current mode.
+ *      The minimum vertical front porch duration is defined as the vertic=
al
+ *      front porch duration for the current mode.
  *
- *=09The maximum vertical front porch duration is greater than or equal to
- *=09the minimum vertical front porch duration. The duration is derived
- *=09from the minimum supported variable refresh rate for the connector.
+ *      The maximum vertical front porch duration is greater than or equal=
 to
+ *      the minimum vertical front porch duration. The duration is derived
+ *      from the minimum supported variable refresh rate for the connector=
.
  *
- *=09The driver may place further restrictions within these minimum
- *=09and maximum bounds.
+ *      The driver may place further restrictions within these minimum
+ *      and maximum bounds.
  */
=20
 /**
@@ -2606,7 +2606,7 @@ EXPORT_SYMBOL(drm_connector_set_panel_orientation);
=20
 /**
  * drm_connector_set_panel_orientation_with_quirk - set the
- *=09connector's panel_orientation after checking for quirks
+ *      connector's panel_orientation after checking for quirks
  * @connector: connector for which to init the panel-orientation property.
  * @panel_orientation: drm_panel_orientation value to set
  * @width: width in pixels of the panel, used for panel quirk detection
@@ -2636,7 +2636,7 @@ EXPORT_SYMBOL(drm_connector_set_panel_orientation_wit=
h_quirk);
=20
 /**
  * drm_connector_set_orientation_from_panel -
- *=09set the connector's panel_orientation from panel's callback.
+ *      set the connector's panel_orientation from panel's callback.
  * @connector: connector for which to init the panel-orientation property.
  * @panel: panel that can provide orientation information.
  *
--=20
2.42.0


