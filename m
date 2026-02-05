Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJsULGeahGmh3gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 14:25:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 294D4F337D
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 14:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDE810E38D;
	Thu,  5 Feb 2026 13:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g762CHTY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05F410E38D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 13:25:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3B80C600AD;
 Thu,  5 Feb 2026 13:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621B1C19424;
 Thu,  5 Feb 2026 13:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770297953;
 bh=KKepWlWv0hhuulM1irvFTuVL+SuskFcvBSAp3M2X3PA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g762CHTYBHDihla3CAznKaBynGBe3ce6oCJe9r56hRr8Ht/YWCtHCwcM3ZqUEHvyT
 cVAoNQrkodHArIg+j2ww7Tb34Zag4u+DpO/NkdcNp9us+u2rx6LcQKOw5NilalEdZM
 MdTj9sYQcWzNkhf7oa00DkTBd2/ilb0vV/9omI3JcEJJRmJoPSHSuvVwyVj4nPwFr4
 +g77QV/qW/xCr4HvgyN7SxAxqA9ZfChZlcTsCsiI6gJ2JlsjYUxe5bY5vzRo3tpeZt
 Uwfq7Piryg7lyFgfXQdUal/yNyvdzTfP4Ph0XNZLa8nwKPGpF4NAOsLEulk5gzVuvT
 cYHfGbhwXEM4Q==
Date: Thu, 5 Feb 2026 14:25:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swamil Jain <s-jain1@ti.com>
Cc: jyri.sarha@iki.fi, tomi.valkeinen@ideasonboard.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 devarsht@ti.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, praneeth@ti.com, vigneshr@ti.com
Subject: Re: [PATCH v2] dt-bindings: display: ti, am65x-dss: Fix AM62L DSS reg
 and clock constraints
Message-ID: <20260205-spectral-dramatic-jellyfish-cec4e2@quoll>
References: <20260129150601.185882-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260129150601.185882-1-s-jain1@ti.com>
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
X-Spamd-Result: default: False [3.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[iki.fi,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,ti.com,lists.freedesktop.org,vger.kernel.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:s-jain1@ti.com,m:jyri.sarha@iki.fi,m:tomi.valkeinen@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devarsht@ti.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:praneeth@ti.com,m:vigneshr@ti.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 294D4F337D
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 08:36:01PM +0530, Swamil Jain wrote:
> The AM62L DSS [1] support incorrectly used the same register and
> clock constraints as AM65x, but AM62L has a single video port.
> 
> Fix this by adding conditional constraints that properly define the
> register regions and clocks for AM62L DSS (single video port) versus
> other AM65x variants (dual video port).
> 
> [1]: Section 12.7 (Display Subsystem and Peripherals)
> Link : https://www.ti.com/lit/pdf/sprujb4
> 
> Fixes: cb8d4323302c ("dt-bindings: display: ti,am65x-dss: Add support for AM62L DSS")
> Cc: stable@vger.kernel.org
> 

There are never blank lines between tags.

> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
> Changelog:
> v1->v2:
> - Remove oneOf from top level constraints, it makes bindings redundant
> - Remove minItems from top level constraints
> - "dma-coherent" property shouldn't be changed in v1 itself
> - Add description for reg-names, clock and clock-names
> - Add constraints specific to AM62L and for other SoCs within allOf
>   check
> 
> Link to v1:
> https://lore.kernel.org/all/20251224133150.2266524-1-s-jain1@ti.com/
> ---
>  .../bindings/display/ti/ti,am65x-dss.yaml     | 93 +++++++++++++------
>  1 file changed, 67 insertions(+), 26 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> index 38fcee91211e..dbc9d754cf9e 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> @@ -36,38 +36,18 @@ properties:
>    reg:
>      description:
>        Addresses to each DSS memory region described in the SoC's TRM.
> -    items:
> -      - description: common DSS register area
> -      - description: VIDL1 light video plane
> -      - description: VID video plane
> -      - description: OVR1 overlay manager for vp1
> -      - description: OVR2 overlay manager for vp2
> -      - description: VP1 video port 1
> -      - description: VP2 video port 2
> -      - description: common1 DSS register area

No, I do not understand this change. We spoke so many times, documented
it, wrotre on presentation slides: broadest constraints are always
defined in top level. TI received this feedback more than once.

Sorry guys, but you are not individual contributors which do it in spare
time. Why the same feedback - already documented - has to be repeated?

Best regards,
Krzysztof

