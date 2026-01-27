Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IbbKnfleGlwtwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 17:19:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFED979FC
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 17:19:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E575D89954;
	Tue, 27 Jan 2026 16:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=thundersoft.com header.i=@thundersoft.com header.b="mlk+gWDN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3275.qiye.163.com (mail-m3275.qiye.163.com
 [220.197.32.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C1810E4EF
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 08:49:13 +0000 (UTC)
Received: from tsdl-HP-EliteDesk-880-G6-Tower-PC.. (unknown [36.129.139.90])
 by smtp.qiye.163.com (Hmail) with ESMTP id 321e5e450;
 Tue, 27 Jan 2026 16:49:06 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: neil.armstrong@linaro.org
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, andersson@kernel.org,
 andrzej.hajda@intel.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hongyang.zhao@thundersoft.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, konradybcio@kernel.org,
 krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, rfoss@kernel.org, robh@kernel.org, rosh@debian.org,
 simona@ffwll.ch, tzimmermann@suse.de, vkoul@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: lt9611: Add dsi-port-b property
Date: Tue, 27 Jan 2026 16:48:54 +0800
Message-ID: <20260127084854.1714905-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7d9041a3-9d2b-469a-9fa7-89d53bbd2a1f@linaro.org>
References: <7d9041a3-9d2b-469a-9fa7-89d53bbd2a1f@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bfea4675109d5kunmba5438e79bdb8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTRlMVkpCQ0NMGEtOHh1DSVYVFAkWGhdVEwETFh
 oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
 VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
 b=mlk+gWDNP+RqWapm0pGEHyn+VNIojWyCvX7Gej8QBEvR0UOoYJrKDabGcSKBLqY7RWJzGheg4L4DEAE7iMcn2Sq8TuXZ8sPDWLjuleu+66t6roxCp3BwwnvVSxy16FIb8Sk+pUecX58R/gJKyAZy7sLyDxQbE21vr5hkZ9met2A=;
 c=relaxed/relaxed; s=default; d=thundersoft.com; v=1; 
 bh=ReKCnW0AuE/9mtifNT8wvXgnWudkFHiGhNf2b73WgFA=;
 h=date:mime-version:subject:message-id:from;
X-Mailman-Approved-At: Tue, 27 Jan 2026 16:18:58 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[hongyang.zhao@thundersoft.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:Laurent.pinchart@ideasonboard.com,m:airlied@gmail.com,m:andersson@kernel.org,m:andrzej.hajda@intel.com,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:hongyang.zhao@thundersoft.com,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:rfoss@kernel.org,m:robh@kernel.org,m:rosh@debian.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:vkoul@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[ideasonboard.com,gmail.com,kernel.org,intel.com,vger.kernel.org,lists.freedesktop.org,thundersoft.com,kwiboo.se,linux.intel.com,debian.org,ffwll.ch,suse.de];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,thundersoft.com:email,thundersoft.com:dkim,thundersoft.com:mid,0.0.0.0:email]
X-Rspamd-Queue-Id: 2CFED979FC
X-Rspamd-Action: no action

> On 1/27/26 07:58, Hongyang Zhao wrote:
> > Document the lontium,dsi-port-b property for selecting DSI Port B as
> > the input source instead of the default Port A.
> >
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > Reviewed-by: Roger Shimizu <rosh@debian.org>
> > ---
> >   .../devicetree/bindings/display/bridge/lontium,lt9611.yaml          | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> > index 655db8cfdc25..9b7dba4e114c 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> > @@ -37,6 +37,12 @@ properties:
> >     vcc-supply:
> >       description: Regulator for 3.3V IO power.
> >
> > +  lontium,dsi-port-b:
> > +    type: boolean
> > +    description:
> > +      Use DSI Port B as the input source instead of Port A or Port A + B.
> > +      Required when the DSI is physically connected to Port B.
>
> This is not how this should be solved, the ports links are here for this exact purpose.
>
> port@0 represents port A, port@1 represent port B, so you need to describe the HW correctly
> in the first place.
>
> Populate only port1 and in the driver check which ports are population and change the
> configuration.
>
> Neil
>
> > +
> >     ports:
> >       $ref: /schemas/graph.yaml#/properties/ports
> >
> >

Hi Neil,

Thanks for the review. You're right - I'll use the ports to describe the
physical connection properly.

I'll update the patches to:
1. Make port@0 optional in the binding (require at least one of port@0 or port@1)
2. Update port descriptions to clarify port@0 = Port A, port@1 = Port B
3. Modify the driver to detect which port is populated and configure accordingly
4. Use port@1 in the RubikPi3 DTS since the DSI is physically connected to Port B

Will send v2 shortly.

Thanks,
Hongyang
