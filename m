Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOYDCx1gcmnbjAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 18:36:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FB86B733
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 18:36:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A48210EA1D;
	Thu, 22 Jan 2026 17:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J2UlAbs/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E2E10EA1D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 17:36:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 881C26013A;
 Thu, 22 Jan 2026 17:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E08C16AAE;
 Thu, 22 Jan 2026 17:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769103383;
 bh=LWuS3t9H4s3n6SwgiZKmTr2O9DxNfnIGAD3zPijQ33Y=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=J2UlAbs/vbrkBlyTHAfoan1jPcOAJxwT4BQ6oTfUzQfCjFYnYuBOLhk45uDRuo3H/
 AJ8YLsNqMPeQk6bxrBUW4PebRQqKIJGaBH3o3sVJ/wCleTmh3Xs3rYCTFcCTV0DjdL
 lFfljb7U/kwXSMP8Jr+si3Cl0QrOaYVUt06WEriczzOsLxWottOB5M33ZaHWcmER1j
 Mk4ThL/ejNwhMrlPiTqkuu5YaIQ2gd2Dv060RYhMQ27NGNiy7CnmBVzhiURLuxKoM4
 Us6ZSRm/FeOLO4R3kRcxyGhfIE6bksw1Y7YGglSW0V6erdeJECMaqujSUGr8LSxRd/
 1+7wE2rIsVeXQ==
Date: Thu, 22 Jan 2026 11:36:22 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Sumit Garg <sumit.garg@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, devicetree@vger.kernel.org, 
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
 Brian Starkey <Brian.Starkey@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>, 
 linux-tegra@vger.kernel.org, John Stultz <jstultz@google.com>, 
 linaro-mm-sig@lists.linaro.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "T . J . Mercier" <tjmercier@google.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: Thierry Reding <thierry.reding@kernel.org>
In-Reply-To: <20260122161009.3865888-3-thierry.reding@kernel.org>
References: <20260122161009.3865888-1-thierry.reding@kernel.org>
 <20260122161009.3865888-3-thierry.reding@kernel.org>
Message-Id: <176910338211.2903017.10944159060341564914.robh@kernel.org>
Subject: Re: [PATCH v2 02/10] dt-bindings: display: tegra: Document memory
 regions
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,gmail.com,linaro.org,vger.kernel.org,linux-foundation.org,kvack.org,arm.com,lists.freedesktop.org,ffwll.ch,google.com,lists.linaro.org,collabora.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:david@redhat.com,m:rppt@kernel.org,m:airlied@gmail.com,m:sumit.garg@kernel.org,m:sumit.semwal@linaro.org,m:devicetree@vger.kernel.org,m:akpm@linux-foundation.org,m:linux-mm@kvack.org,m:Brian.Starkey@arm.com,m:conor+dt@kernel.org,m:simona@ffwll.ch,m:linux-tegra@vger.kernel.org,m:jstultz@google.com,m:linaro-mm-sig@lists.linaro.org,m:krzk+dt@kernel.org,m:tjmercier@google.com,m:benjamin.gaignard@collabora.com,m:thierry.reding@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.312];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: 63FB86B733
X-Rspamd-Action: no action


On Thu, 22 Jan 2026 17:10:01 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the memory-region and memory-region-names properties to the bindings
> for the display controllers and the host1x engine found on various Tegra
> generations. These memory regions are used to access firmware-provided
> framebuffer memory as well as the video protection region.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/display/tegra/nvidia,tegra186-dc.yaml     | 10 ++++++++++
>  .../bindings/display/tegra/nvidia,tegra20-dc.yaml      | 10 +++++++++-
>  .../bindings/display/tegra/nvidia,tegra20-host1x.yaml  |  7 +++++++
>  3 files changed, 26 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml: properties:memory-region-names: 'anyOf' conditional failed, one must be fixed:
	'maxitems' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml: properties:memory-region-names:items: {'enum': ['framebuffer', 'protected']} is not of type 'array'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml: properties:memory-region-names: Additional properties are not allowed ('maxitems' was unexpected)
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml: properties:memory-region-names:items: {'enum': ['framebuffer', 'protected']} is not of type 'array'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml: properties:memory-region-names: Additional properties are not allowed ('maxitems' was unexpected)
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260122161009.3865888-3-thierry.reding@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

