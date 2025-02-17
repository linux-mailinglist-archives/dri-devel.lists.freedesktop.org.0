Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F62A37CD1
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 09:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A1010E261;
	Mon, 17 Feb 2025 08:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="TI9mz/Od";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vVBGykm9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TI9mz/Od";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vVBGykm9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69E210E261
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 08:11:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4D8F02118B;
 Mon, 17 Feb 2025 08:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739779876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XeG/9OvW4s4fWjwDpd+PTrr+ChqVd2sACHNzPL8rDXI=;
 b=TI9mz/Oddc4lKhvQus4PdKAsSEtIDZVrlEuSlmzOqE9trnBJVEcphdNhgezq7MCPBc3hRU
 SMJoRAuY9+51zGwC+Jdmn8/a/dvpSe4zxorV7XTRzOX+Pw3916h4nD8tvbrmIghtZIPHJs
 fF5v3UTFVhl302/+J2t5ldUahlupNc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739779876;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XeG/9OvW4s4fWjwDpd+PTrr+ChqVd2sACHNzPL8rDXI=;
 b=vVBGykm9xF/F9XofZyNBKxEzx4lg70Vx2Bmy6tNC2dY0BHtNuP/WEjve0esT0jG+ZDXqQf
 cEfSxhJtUn7zH0DA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="TI9mz/Od";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vVBGykm9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739779876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XeG/9OvW4s4fWjwDpd+PTrr+ChqVd2sACHNzPL8rDXI=;
 b=TI9mz/Oddc4lKhvQus4PdKAsSEtIDZVrlEuSlmzOqE9trnBJVEcphdNhgezq7MCPBc3hRU
 SMJoRAuY9+51zGwC+Jdmn8/a/dvpSe4zxorV7XTRzOX+Pw3916h4nD8tvbrmIghtZIPHJs
 fF5v3UTFVhl302/+J2t5ldUahlupNc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739779876;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XeG/9OvW4s4fWjwDpd+PTrr+ChqVd2sACHNzPL8rDXI=;
 b=vVBGykm9xF/F9XofZyNBKxEzx4lg70Vx2Bmy6tNC2dY0BHtNuP/WEjve0esT0jG+ZDXqQf
 cEfSxhJtUn7zH0DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F0291133F9;
 Mon, 17 Feb 2025 08:11:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mwDiOCPvsmewIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Feb 2025 08:11:15 +0000
Message-ID: <730652e4-3fb0-4dc5-9a95-10d167b3128c@suse.de>
Date: Mon, 17 Feb 2025 09:11:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Include ASPEED ast-drm 1.15.1 video driver in kernel tree
To: Nicolas Baranger <nicolas.baranger@3xo.fr>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
References: <d507f6268ea3158b5af82b6860ca7b71@3xo.fr>
 <194c4656963debcf074d87e89ab1a829@3xo.fr>
 <b296bfef-1a9c-4452-baeb-09f86758addd@suse.de>
 <984c317de1027f5886390a65f1f66126@3xo.fr>
 <cd7a9908-d4ba-45ca-a5cb-de8ac7ef72d0@redhat.com>
 <7c378bfb-96e4-435d-8e6c-581d6851835f@suse.de>
 <963e8bf72515f68e1b788383361dbe74@3xo.fr>
 <95e8b6edb00f48776d9153555d05270a@3xo.fr>
 <a6d28a9cd8dd7ae902d4c38cf58b622a@3xo.fr>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <a6d28a9cd8dd7ae902d4c38cf58b622a@3xo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4D8F02118B
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[redhat.com,lists.freedesktop.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,vger.kernel.org];
 MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[9]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:dkim, suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO
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

Hi

Am 14.02.25 um 18:52 schrieb Nicolas Baranger:
> Hi Thomas, Jocelyn
>
> Same error with linux-6.1.124 debian package ...
> It's reported in log as a drm bug by kernel:
>
> ------------[ cut here ]------------
> BUG: the value to copy was not set!
> WARNING: CPU: 13 PID: 6163 at drivers/gpu/drm/drm_ioctl.c:478 
> drm_copy_field+0xa2/0xb0 [drm]

All these errors don't look as if they are directly related to ast. It's 
something in the DRM core or Xorg.

>
> This server had already work with Linux 6.1 in the past so I don't 
> know what to think...
> The last linux-6.1 version I'm sure that had work on this server was 
> 6.1.85 (according to my post here 
> https://bugzilla.kernel.org/show_bug.cgi?id=219480#c3)

That's btrfs AFAICS; so not related to ast.

What happens on older kernels, such as 6.0, 5.*, etc. I'd be interested 
in finding an old kernel with acceptable ast performance. That we can 
compare the code or further bisect.

Best regards
Thomas

>
> Maybe I should install a new Debian system on a usb stick for doing tests
>
> Going back here with next results
> Thanks again for help
>
>
> Kind regards,
> Nicolas Baranger
>
>
>
> Le 2025-02-14 18:03, Nicolas Baranger a écrit :
>
>> Hi Thomas, Jocelyn
>>
>> Starting with 6.1.128 longterm kernel failed and it seems to be a 
>> 'drm error'
>>
>> Xorg error :
>>
>> (==) Log file: "/var/log/Xorg.0.log", Time: Fri Feb 14 17:32:59 2025
>> (==) Using system config directory "/usr/share/X11/xorg.conf.d"
>> (==) No Layout section.  Using the first Screen section.
>> (==) No screen section available. Using defaults.
>> (**) |-->Screen "Default Screen Section" (0)
>> (**) |   |-->Monitor "<default monitor>"
>> (==) No monitor specified for screen "Default Screen Section".
>> a default monitor configuration.
>> (==) Automatically adding devices
>> (==) Automatically enabling devices
>> (==) Automatically adding GPU devices
>> (==) Automatically binding GPU devices
>> (==) Max clients allowed: 256, resource mask: 0x1fffff
>> (WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
>> Entry deleted from font path.
>> (==) FontPath set to:
>> /usr/share/fonts/X11/misc,
>> /usr/share/fonts/X11/100dpi/:unscaled,
>> /usr/share/fonts/X11/75dpi/:unscaled,
>> /usr/share/fonts/X11/Type1,
>> /usr/share/fonts/X11/100dpi,
>> /usr/share/fonts/X11/75dpi,
>> built-ins
>> (==) ModulePath set to "/usr/lib/xorg/modules"
>> (II) The server relies on udev to provide the list of input devices.
>> no devices become available, reconfigure udev or disable AutoAddDevices.
>> (II) Loader magic: 0x561372a83f00
>> (II) Module ABI versions:
>> X.Org ANSI C Emulation: 0.4
>> X.Org Video Driver: 25.2
>> X.Org XInput driver : 24.4
>> X.Org Server Extension : 10.0
>> (++) using VT number 1
>>
>> (II) systemd-logind: took control of session 
>> /org/freedesktop/login1/session/c13
>> (II) xfree86: Adding drm device (/dev/dri/card1)
>> (II) Platform probe for 
>> /sys/devices/pci0000:00/0000:00:03.0/0000:01:00.0/drm/card1
>> (II) systemd-logind: got fd for /dev/dri/card1 226:1 fd 14 paused 0
>> (EE)
>> (EE) Backtrace:
>> (EE) 0: /usr/lib/xorg/Xorg (OsLookupColor+0x139) [0x5613729f7f79]
>> (EE) 1: /lib/x86_64-linux-gnu/libc.so.6 (__sigaction+0x40) 
>> [0x7f0dad05b050]
>> (EE) 2: /lib/x86_64-linux-gnu/libc.so.6 
>> (__nss_database_lookup+0xcd19) [0x7f0dad17m.so.2 (drmGetVe728e67a4]
>> (EE) 6: /usr/lib/xorg/Xorg (xf86PlatformDeviceCheckBusID+0x1bb) 
>> [0x5613728e6aab]
>> (EE) 7: /usr/lib/xorg/Xorg (config_fini+0x19b7) [0x5613728e3a97]
>> (EE) 8: /usr/lib/xorg/Xorg (xf86PlatformMatchDriver+0x1b5) 
>> [0x5613728e0615]
>> (EE) 9: /usr/lib/xorg/Xorg (xf86BusProbe+0x9) [0x5613728b9329]
>> (EE) 10: /usr/lib/xorg/Xorg (InitOutput+0x69a) [0x5613728c72ca]
>> (EE) 11: /usr/lib/xorg/Xorg (InitFonts+0x1ce) [0x56137288866e]
>> (EE) 12: /lib/x86_64-linux-gnu/libc.so.6 (__libc_init_first+0x8a) 
>> [0x7f0dad04624a]
>> (EE) 13: /lib/x86_64-linux-gnu/libc.so.6 (__libc_start_main+0x85) 
>> [0x7f0dad046305]
>> (EE) 14: /usr/lib/xorg/Xorg (_start+0x21) [0x561372871b71]
>> (EE)
>> (EE) Segmentation fault at address 0x0
>> (EE)
>> server error:
>> (EE) Caught signal 11 (Segmentation fault). Server aborting
>> (EE)
>> (EE)
>> consult the The X.Org Foundation support
>> at http://wiki.x.org
>> for help.
>> (EE) Please also check the log file at "/var/log/Xorg.0.log" for 
>> additional information.
>> (EE)
>> (EE) Server terminated with error (1). Closing log file.
>>
>> Kernel trace :
>>
>> ------------[ cut here ]------------
>> BUG: the value to copy was not set!
>> WARNING: CPU: 10 PID: 6240 at drivers/gpu/drm/drm_ioctl.c:478 
>> drm_copy_field+0xa2/0xb0 [drm]
>> Modules linked in: xt_CHECKSUM(E) xt_MASQUERADE(E) xt_conntrack(E) 
>> ipt_REJECT(E) nf_reject_ipv4(E) xt_tcpudp(E) nft_compat(E) 
>> nft_chain_nat(E) nf_tables(E) nls_utf8(E) nfnetlink(E) 
>> cpufreq_userspace(E) cifs(E) l2tp_ppp(E) cifs_arc4(E) l2tp_netlink(E) 
>> cpufreq_ondemand(E) rdma_cm(E) l2tp_core(E) iw_cm(E) 
>> ip6_udp_tunnel(E) udp_tunnel(E) cpufreq_conservative(E) ib_cm(E) 
>> pppox(E) ppp_generic(E) slhc(E) ib_core(E) cifs_md4(E) 
>> dns_resolver(E) cpufreq_powersave(E) xfrm_user(E) xfrm_algo(E) 
>> scsi_transport_iscsi(E) nvme_fabrics(E) team_mode_loadbalance(E) 
>> 8021q(E) garp(E) mrp(E) team(E) bridge(E) stp(E) llc(E) qrtr(E) 
>> openvswitch(E) nsh(E) nf_conncount(E) nf_nat(E) nf_conntrack(E) 
>> nf_defrag_ipv6(E) nf_defrag_ipv4(E) cmac(E) algif_hash(E) 
>> algif_skcipher(E) af_alg(E) bnep(E) binfmt_misc(E) nls_ascii(E) 
>> nls_cp437(E) vfat(E) fat(E) ext4(E) mbcache(E) jbd2(E) 
>> intel_rapl_msr(E) intel_rapl_common(E) nvidia_drm(POE) 
>> snd_hda_codec_hdmi(E) snd_hda_codec_realtek(E) snd_hda_codec_generic(E)
>> nvidia_modeset(POE) intel_uncore_frequency(E) 
>> intel_uncore_frequency_common(E) sb_edac(E) btusb(E) snd_hda_intel(E) 
>> btrtl(E) snd_usb_audio(E) x86_pkg_temp_thermal(E) btbcm(E) 
>> snd_intel_dspcfg(E) snd_intel_sdw_acpi(E) intel_powerclamp(E) 
>> snd_usbmidi_lib(E) btintel(E) snd_rawmidi(E) coretemp(E) btmtk(E) 
>> snd_seq_device(E) snd_hda_codec(E) nvidia(POE) eeepc_wmi(E) 
>> snd_hda_core(E) mc(E) snd_pcsp(E) snd_hwdep(E) rapl(E) asus_wmi(E) 
>> ipmi_ssif(E) battery(E) iTCO_wdt(E) bluetooth(E) intel_cstate(E) 
>> snd_pcm(E) sparse_keymap(E) ledtrig_audio(E) snd_timer(E) 
>> intel_pmc_bxt(E) acpi_ipmi(E) platform_profile(E) intel_uncore(E) 
>> crc16(E) wmi_bmof(E) rfkill(E) mei_me(E) iTCO_vendor_support(E) 
>> ipmi_si(E) snd(E) watchdog(E) mei(E) video(E) soundcore(E) 
>> ipmi_devintf(E) ipmi_msghandler(E) joydev(E) evdev(E) sg(E) msr(E) 
>> parport_pc(E) ppdev(E) nfsd(E) lp(E) parport(E) auth_rpcgss(E) 
>> nfs_acl(E) lockd(E) grace(E) loop(E) efi_pstore(E) configfs(E) 
>> sunrpc(E) ip_tables(E) x_tables(E) autofs4(E)
>> btrfs(E) blake2b_generic(E) zstd_compress(E) efivarfs(E) raid10(E) 
>> sr_mod(E) cdrom(E) hid_logitech_hidpp(E) hid_plantronics(E) 
>> hid_logitech_dj(E) hid_generic(E) uas(E) usbhid(E) hid(E) 
>> usb_storage(E) raid456(E) async_raid6_recov(E) async_memcpy(E) 
>> async_pq(E) async_xor(E) async_tx(E) xor(E) raid1(E) raid0(E) 
>> raid6_pq(E) dm_mod(E) crc32c_intel(E) md_mod(E) sd_mod(E) ast(E) 
>> drm_vram_helper(E) drm_ttm_helper(E) ghash_clmulni_intel(E) ttm(E) 
>> sha512_ssse3(E) sha256_ssse3(E) drm_kms_helper(E) sha1_ssse3(E) 
>> ahci(E) libahci(E) xhci_pci(E) ehci_pci(E) xhci_hcd(E) ehci_hcd(E) 
>> aesni_intel(E) nvme(E) mxm_wmi(E) igb(E) libata(E) crypto_simd(E) 
>> i2c_i801(E) cryptd(E) drm(E) dca(E) i2c_smbus(E) lpc_ich(E) 
>> usbcore(E) scsi_mod(E) i2c_algo_bit(E) nvme_core(E) t10_pi(E) 
>> usb_common(E) scsi_common(E) i40e(E) wmi(E) button(E)
>> CPU: 10 PID: 6240 Comm: Xorg Tainted: P           OE 6.1.128-amd64 #0
>> Hardware name: ASUS All Series/X99-WS/IPMI, BIOS 4001 05/28/2019
>> RIP: 0010:drm_copy_field+0xa2/0xb0 [drm]
>> Code: 00 00 74 13 49 c7 45 00 00 00 00 00 eb e0 0f 0b b8 f2 ff ff ff 
>> eb d9 48 c7 c7 70 cb 17 c1 c6 05 43 17 07 00 01 e8 2e 09 57 dd <0f> 
>> 0b eb d6 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 0f 1f 44 00
>> RSP: 0018:ffffbd9941b0fba8 EFLAGS: 00010286
>> RAX: 0000000000000000 RBX: ffffbd9941b0fc60 RCX: 0000000000000027
>> RDX: ffff9ec3bf6a13a8 RSI: 0000000000000001 RDI: ffff9ec3bf6a13a0
>> RBP: ffff9e8487476800 R08: 0000000000000000 R09: ffffbd9941b0fa20
>> R10: 0000000000000003 R11: ffff9ec3bff15ee8 R12: ffffffffc1132570
>> R13: ffffbd9941b0fc80 R14: ffff9e85881d7200 R15: 0000000000000040
>> FS:  00007f59dd209ac0(0000) GS:ffff9ec3bf680000(0000) 
>> knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 000056272a2123d0 CR3: 000000010c396005 CR4: 00000000003706e0
>> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>> Call Trace:
>> <TASK>
>> ? __warn+0x81/0xd0
>> ? drm_copy_field+0xa2/0xb0 [drm]
>> ? report_bug+0xe6/0x150
>> ? handle_bug+0x41/0x70
>> ? exc_invalid_op+0x17/0x70
>> ? asm_exc_invalid_op+0x1a/0x20
>> ? drm_ioctl_flags+0x50/0x50 [drm]
>> ? drm_copy_field+0xa2/0xb0 [drm]
>> ? drm_copy_field+0xa2/0xb0 [drm]
>> ? drm_ioctl_flags+0x50/0x50 [drm]
>> drm_version+0x73/0xa0 [drm]
>> drm_ioctl_kernel+0xcd/0x170 [drm]
>> drm_ioctl+0x233/0x410 [drm]
>> ? drm_ioctl_flags+0x50/0x50 [drm]
>> __x64_sys_ioctl+0x94/0xd0
>> do_syscall_64+0x59/0xb0
>> ? vfs_write+0x2b1/0x3f0
>> ? vfs_write+0x2b1/0x3f0
>> ? ksys_write+0x6f/0xf0
>> ? exit_to_user_mode_prepare+0x40/0x1e0
>> ? syscall_exit_to_user_mode+0x22/0x40
>> ? do_syscall_64+0x65/0xb0
>> ? __x64_sys_fcntl+0x94/0xc0
>> ? exit_to_user_mode_prepare+0x40/0x1e0
>> ? syscall_exit_to_user_mode+0x22/0x40
>> ? do_syscall_64+0x65/0xb0
>> ? syscall_exit_to_user_mode+0x22/0x40
>> ? do_syscall_64+0x65/0xb0
>> ? exit_to_user_mode_prepare+0x40/0x1e0
>> entry_SYSCALL_64_after_hwframe+0x6e/0xd8
>> RIP: 0033:0x7f59dd31ccdb
>> Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 
>> 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> 
>> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
>> RSP: 002b:00007fff22f5d440 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>> RAX: ffffffffffffffda RBX: 000056272a211f10 RCX: 00007f59dd31ccdb
>> RDX: 000056272a211f10 RSI: 00000000c0406400 RDI: 000000000000000e
>> RBP: 000056272a211f10 R08: 00007f59dd3f1cc0 R09: 0000000000000070
>> R10: 00007f59dd236378 R11: 0000000000000246 R12: 00000000c0406400
>> R13: 000000000000000e R14: 000000000000000e R15: 000056272a211510
>> </TASK>
>> ---[ end trace 0000000000000000 ]---
>>
>> Maybe my Xorg is too recent (but I hope not) as I don't want to 
>> downgrade Xorg (nor reinstall an older debian version) so I will try 
>> another kernel version...
>> 6.1.128 was build by me and maybe the 'make olddefconfig' from 
>> mainline to 6.1.128 lost too many options (for ex 
>> device-drivers/graphic-support>drm does not exist in menuconfig and I 
>> found AST module directly in device-drivers/graphic-support ...)
>> 6.1.124 exist prepackaged by Debian so it .config should be more 
>> generic so I will test it
>>
>> Thanks again for help,
>>
>> Kind regards
>> Nicolas Baranger
>>
>> Le 2025-02-14 16:01, Nicolas Baranger a écrit :
>>
>> Hi Thomas
>>
>> Thanks again for help
>>
>> Nicolas, if you find an old kernel version that works correctly, and 
>> if you know how to git-bisect the kernel, it would be helpful if you 
>> could bisect to the commit that introduced the problem.
>> Ok, I will try to find a working kernel and to git bisect to find the 
>> commit which introduce the problem.
>> I will start with longterm 6.1.128
>>
>> Kind regards
>> Nicolas
>>
>> Le 2025-02-14 13:36, Thomas Zimmermann a écrit :
>>
>> Hi Jocelyn
>>
>> Am 14.02.25 um 10:11 schrieb Jocelyn Falempe: On 13/02/2025 10:27, 
>> Nicolas Baranger wrote: Dear Thomas
>>
>> Thanks for answer and help.
>>
>> Yes, due to .date total removal in linux 6.14 (https://github.com/ 
>> torvalds/linux/commit/cb2e1c2136f71618142557ceca3a8802e87a44cd 
>> <https:// github.com/torvalds/linux/commit/ 
>> cb2e1c2136f71618142557ceca3a8802e87a44cd>) the last DKMS sources are :
>> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/ 
>> nba_last_src_20250212/src/ <https://xba.soartist.net/ast- 
>> drm_nba_20250211/nba-dkms/nba_last_src_20250212/src/>
>>
>> You can also find this sources in directory drivers/gpu/drm/ast_new 
>> of the tarball 
>> https://xba.soartist.net/ast-drm_nba_20250211/nba-kernel/ 
>> linux-6.14.0.1-ast1.15.1-rc2_nba0_20250212.tar.gz <https:// 
>> xba.soartist.net/ast-drm_nba_20250211/nba-kernel/linux-6.14.0.1- 
>> ast1.15.1-rc2_nba0_20250212.tar.gz>
>>
>> I'm surprised by the fact the in-kernel driver 0.1.0 is more advanced 
>> than Aspeed version 1.15.1 because on my system it has very poor 
>> rendering and is very slow, twinkle is high and had poor colors.
>> The screen flickering is high and it's like if I was using a very old 
>> cathode ray tube monitor (In fact I'm using a SAMSUNG LCD monitor 
>> which is perfectly functionnal and which display a nice and eyes 
>> confortable picture when using ast 1.15.1 driver or the video output 
>> of the Nvidia GPU ).
>>
>> My testing system is a test Xeon server with an AST2400 BMC with its 
>> AST VGA card as the main video output (to be able to have a screen on 
>> the BMC KVM) +a discrete NVIDIA GPU I'm using for GPGPU and 3D 
>> rendering with Nvidia prime render offload.
>> What I constat with embed kernel driver 0.1.0 is that the Xeon 
>> processor is doing the video job for example when watching a video, 
>> and it's not the case with version 1.15.1 even when displaying on the 
>> AST VGA card a vulkan rotating cube (compute by nvidia GPU with 
>> nvidia prime but display by the AST VGA card of the AST2400).
>> Note that with in-kernel version 0.1.0 it's nearly impossible to make 
>> round the vulkan cube at more than half a round by  second where it's 
>> working (very) fine for a 32MB video memory card with version 1.15.1 
>> as you can see in the video present in the online directory
>>
>> I'm not developer or kernel developer so be sure that I wouldn't have 
>> done all this work if the in-kernel ast version 0.1.0 was usable 
>> out-of- the-box
>>
>> Sure you can give me a patch I will test on this server (building 
>> mainline+ast_new yesterday tooks 19 minutes on this server)
>>
>> PS:
>> here is a 'git diff linux-6.14.0.1-ast-rc2/drivers/gpu/drm/ast 
>> linux-6.14.0.1-ast-rc2/drivers/gpu/drm/ast_new'
>> https://xba.soartist.net/ast-drm_nba_20250211/nba-dump/ast- 
>> fullpatch.patch 
>> <https://xba.soartist.net/ast-drm_nba_20250211/nba-dump/ 
>> ast-fullpatch.patch>
>> Diff is about 250+ kb so the 2 drivers seems to have nothing to do 
>> with each others...
>>
>> Thanks again for help
>>
>> Kind regards
>> Nicolas
>>
>> Le 2025-02-13 08:57, Thomas Zimmermann a écrit :
>>
>> Hi Nicolas
>>
>> Am 12.02.25 um 19:58 schrieb Nicolas Baranger: Dear maintener
>> That's mostly me and Jocelyn.
>>
>> I did include ast-drm driver version 1.15.1 (in replacement of 
>> version 0.1.0) on the new mainline kernel too (6.14.0-rc2) and I 
>> issue a new dkms patch
>>
>> Last DKMS patch had been sucessfully tested on mainline.
>> And last ast.ko version 1.15.1 included in linux tree had also been 
>> sucessfully tested
>>
>> Online directory is updated with :
>> - new DKMS patch
>> - new DKMS srouces
>> - new DKMS debian package
>> - new tarball of mainline included ast_new ported in kernel tree
>> - new kernel debian package (mainline with ast_new)
>>
>> NB: online directory is here: https://xba.soartist.net/ast- 
>> drm_nba_20250211/ <https://xba.soartist.net/ast-drm_nba_20250211/>
>>
>> Please let me know what I should do to see this change in linux-next
>> I'm having a little trouble with figuring out which of the many 
>> driver sources is the relevant one. Am I correct to assume it's the 
>> one at
>>
>> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/ 
>> nba_last_src_20250212/src/ <https://xba.soartist.net/ast- 
>> drm_nba_20250211/nba-dkms/nba_last_src_20250212/src/>
>>
>> About that driver: Although the official driver reports an ancient 
>> version number, it is an up-to-date driver. It is actually more 
>> up-to- date than Aspeed's package. Both drivers share source code and 
>> a few years ago there was an effort to bring the kernel's driver up 
>> to the same feature set. Since then, the kernel's driver has been 
>> updated, reworked and improved.
>>
>> About the performance: From what I can tell, the only significant 
>> difference in these drivers is memory management. Your ast_new driver 
>> uses an older algorithm that we replaced quite a few releases ago. 
>> The old version was unreliable on systems with little video memory, 
>> so we had to replace it.  I don't know why the new code should be 
>> slower though.
>> Regarding the performances of ast driver, I remember doing profiling 
>> some times ago, and when running glxgears (with llvmpipe), 65% of the 
>> CPU time was wasted in page fault 
>> (https://elixir.bootlin.com/linux/v6.13.2/source/drivers/gpu/drm/drm_gem_shmem_helper.c#L534)
>> But as this driver is mostly used for console/basic desktop usage, I 
>> didn't investigate more.
>> Now that's an interesting find. The GEM shmem helpers vunmap ASAP to 
>> make pages swappable, I think. IIRC there was a patchset circulating 
>> that implements a shrinker [1] for shmem helpers. With that in place, 
>> we'd only update the page tables if necessary. If it's really that 
>> easy, we should try to merge that.
>>
>> [1] 
>> https://elixir.bootlin.com/linux/v6.13.2/source/include/linux/shrinker.h#L82
>>
>> If I remember correctly, the switch to shmem, is because some devices 
>> have only 16MB of memory, and 1920x1200x32bits takes ~9MB, so it's 
>> not possible to have double buffering in this case. (And this is 
>> required by most desktop environment).
>> Exactly. There are ast devices with as little as 8 MiB of video 
>> memory. But FullHD@32bit already requires ~8 MiB. Atomic modesetting 
>> with the old memory manager requires overcommitting by a factor of 3 
>> (to ~24 MiB) to account for all corner cases. Hence we sometimes had 
>> failed display updates with lower-end devices.
>>
>> The switch to shmem was done with "f2fa5a99ca81c drm/ast: Convert ast 
>> to SHMEM", and introduced in v6.2. So maybe if you can try with a 
>> v6.1 kernel, using the built-in ast driver and report if it has 
>> better performances.
>> Nicolas, if you find an old kernel version that works correctly, and 
>> if you know how to git-bisect the kernel, it would be helpful if you 
>> could bisect to the commit that introduced the problem.
>>
>> Best regards
>> Thomas
>>
>> Best regards,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

