Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A6911A6C0
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:21:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5256EAC0;
	Wed, 11 Dec 2019 09:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from protonic.nl (protonic.xs4all.nl [83.163.252.89])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1A9516E19C;
 Wed, 11 Dec 2019 08:35:36 +0000 (UTC)
Received: from webmail.promanet.nl (edge2.prtnl [192.168.1.170])
 by sparta (Postfix) with ESMTP id B678944A004C;
 Wed, 11 Dec 2019 09:35:33 +0100 (CET)
MIME-Version: 1.0
Date: Wed, 11 Dec 2019 09:35:35 +0100
From: robin <robin@protonic.nl>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 12/12] auxdisplay: constify fb ops
In-Reply-To: <87pngx4muv.fsf@intel.com>
References: <cover.1575390740.git.jani.nikula@intel.com>
 <31c18e3ce9d6962aabda4799b3051039ff591c92.1575390741.git.jani.nikula@intel.com>
 <87pngx4muv.fsf@intel.com>
Message-ID: <7c78b5c7421f75c2afdeb4b3a15c8a09@protonic.nl>
X-Sender: robin@protonic.nl
User-Agent: Roundcube Webmail/1.3.6
X-Mailman-Approved-At: Wed, 11 Dec 2019 09:20:35 +0000
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
Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>,
 linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Jani,

On 2019-12-09 15:03, Jani Nikula wrote:
> On Tue, 03 Dec 2019, Jani Nikula <jani.nikula@intel.com> wrote:
>> Now that the fbops member of struct fb_info is const, we can start
>> making the ops const as well.
>> 
>> Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
>> Cc: Robin van der Gracht <robin@protonic.nl>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Reviewed-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
>> Acked-by: Robin van der Gracht <robin@protonic.nl>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> Miguel, Robin, just to err on the safe side, were you both okay with me
> merging this through drm-misc? Not very likely to conflict badly.

ht16k33 driver hasn't seen much change lately, should be fine.

Robin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
