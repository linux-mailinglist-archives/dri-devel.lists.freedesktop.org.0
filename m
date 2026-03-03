Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKZaOLBSp2lsgwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:29:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 668F21F7879
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D7310E8DD;
	Tue,  3 Mar 2026 21:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=acm.org header.i=@acm.org header.b="E6KvA0WU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD71510E8DD
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 21:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by 011.lax.mailroute.net (Postfix) with ESMTP id 4fQTT738V1z1XM0pD;
 Tue,  3 Mar 2026 21:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
 content-transfer-encoding:content-type:content-type:in-reply-to
 :content-language:references:from:from:subject:subject
 :user-agent:mime-version:date:date:message-id:received:received;
 s=mr01; t=1772573353; x=1775165354; bh=9ynOclQ3uytyJeDDhwGcswlJ
 Cmq2hElyOSKIspe/esU=; b=E6KvA0WUdsoA8QKAzHECiCTqJ6VT3Dd85gfwaF1M
 qiR5xBIiNCZkuk2Q+Yas+iuCPp2od/vjh5R3J5tQ/wEvcGqYI+FNqWunSfBcbXdc
 L0lGPHbn3xZHZ6kNlaqUaprvjbiKGmzbTztg2KlJWRu56nXp+cF41DsyrPKyOLSn
 CJsTeLru4SojqcExYg03MVjTnOD8Pofbok+1UeJUQEA874Mgt27HGdoct0bmsX0s
 q/HVtl3F+674rNAoarZVAVdPg3lW27ZywGPWNWGOdr8LUWtkg3wurHZ4tEsnn1ix
 h+7/+I+bKHYIwP77hlxeFi22X/iMGJUvgAqpujcBQoJGkA==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 7zSNimIb1FNe; Tue,  3 Mar 2026 21:29:13 +0000 (UTC)
Received: from [192.168.132.187] (unknown [12.150.89.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4fQTT40prKz1XM0nm;
 Tue,  3 Mar 2026 21:29:11 +0000 (UTC)
Message-ID: <618eb79a-3945-45b3-a7cf-7c073aa28039@acm.org>
Date: Tue, 3 Mar 2026 15:29:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: __drm_fb_helper_initial_config_and_unlock() question
From: Bart Van Assche <bvanassche@acm.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
References: <7dcaf8d7-ed5d-4bfb-8c35-1e5f0dfbae56@acm.org>
Content-Language: en-US
In-Reply-To: <7dcaf8d7-ed5d-4bfb-8c35-1e5f0dfbae56@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Queue-Id: 668F21F7879
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bvanassche@acm.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bvanassche@acm.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[acm.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,acm.org:dkim,acm.org:email,acm.org:mid]
X-Rspamd-Action: no action

On 3/3/26 3:15 PM, Bart Van Assche wrote:
> The comment above __drm_fb_helper_initial_config_and_unlock() says
> "Drops fb_helper->lock before returning". However, there is an
> error path in that function that does not drop fb_helper->lock:
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info =3D drm_fb_helper_allo=
c_info(fb_helper);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(info))
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return PTR_ERR(info);
>=20
> Is the code correct or is the comment correct? I don't think that
> both can be correct.

(+Thomas)

Thomas,

Does this untested patch make sense to you?

Thanks,

Bart.


drm: Fix a locking bug in an error path

Make sure that __drm_fb_helper_initial_config_and_unlock() unlocks
fb_helper->lock. This has been detected by the Clang thread-safety
analyzer.

Fixes: 63c971af4036 ("drm/fb-helper: Allocate and release fb_info in=20
single place")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>

diff --git a/drivers/gpu/drm/drm_fb_helper.c=20
b/drivers/gpu/drm/drm_fb_helper.c
index 05803169bed5..16bfbfb0af16 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1641,8 +1641,10 @@ __drm_fb_helper_initial_config_and_unlock(struct=20
drm_fb_helper *fb_helper)
         drm_client_modeset_probe(&fb_helper->client, width, height);

         info =3D drm_fb_helper_alloc_info(fb_helper);
-       if (IS_ERR(info))
+       if (IS_ERR(info)) {
+               mutex_unlock(&fb_helper->lock);
                 return PTR_ERR(info);
+       }

         ret =3D drm_fb_helper_single_fb_probe(fb_helper);
         if (ret < 0) {

