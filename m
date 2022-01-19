Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 900FA4936FA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 10:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BF610E8DA;
	Wed, 19 Jan 2022 09:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E224810E8DA;
 Wed, 19 Jan 2022 09:15:10 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id j2so8093491edj.8;
 Wed, 19 Jan 2022 01:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=+wBLyr24cGi7atsVZkoQIwe3uAQ6ojShCI+jVRO74lw=;
 b=ao0v25V0JGLDJrhWghxLs60wWofvYKqtQxj3HBEQwJaDJTjv/Lzjrj4cmemvRZiGaF
 3TQidRCj+lverr4MTeq8/sW4jCpameXalGUF2xTcsf1j3o7Htw3+0219zMDSBePHXhL5
 DuQj2jQKZn6LEZuOCXNwh/ShlaY9RXT37ynos6fjkEDSr2tSo9ySjFFwTQC7rk026W7V
 o0G+X0sxXxEf4TtJeNf9/z9TlVQYD6hhAmdChaWaVsPmenf9MD+qhkx+J37qut75KuAn
 dkAEcMLtoR9Lh+QFJ4zNg5am9VWdnNH2QsvS/hSk1J58K0EC7y8mBIX8RCT4EDbardBR
 hswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=+wBLyr24cGi7atsVZkoQIwe3uAQ6ojShCI+jVRO74lw=;
 b=CxBUIZ8wRo9373/Sts+130CKPolzrDECrccQyTc9xRjqR6Wuxrn7QEAS1pI4ZVv4oC
 Eb029Z06HmgLoRMBuxVmIhNeK5Bz06IpNNLCt5HDb7+xE2Otap8oyVqsA+zHjt0X7egE
 CRVoaFBufYjTOp79/OBhZIVGzozzkhMRZnm1KOKbNO8LkTsZKuE0cloLXzayvP/FBhme
 xc20VHhceJXwiDZtADkz1f9S6zL6h57HkLtUYJHMl23lcMLFVaeBoOILZLctKIOiwZU7
 vA1QC47yPggxiqkY92kusseBZFBvTLIJN+lu81M1DV/pAFtnGVmVVQkT52Se3ioxoCPY
 BHWA==
X-Gm-Message-State: AOAM531c8K2ss1gz1MjvK94nS4IFiVNf42U3VMiJCxFuLi1QtzhlL/88
 qx8AAuAk0+vHpys+r7bnrtGrgtieZYL8YzhsQSo=
X-Google-Smtp-Source: ABdhPJzWXVKEVPSd+/ybJqb9qB+8jj+Kj3hkYFRJGGmlEfb5sp9rfzec4m4cysQ94quYGJ2bZ7zcfx+15OJ7T7ROWKk=
X-Received: by 2002:a17:906:5d0f:: with SMTP id
 g15mr5198009ejt.44.1642583709284; 
 Wed, 19 Jan 2022 01:15:09 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:907:9713:0:0:0:0 with HTTP; Wed, 19 Jan 2022 01:15:08
 -0800 (PST)
In-Reply-To: <20220119072450.2890107-2-lucas.demarchi@intel.com>
References: <20220119072450.2890107-1-lucas.demarchi@intel.com>
 <20220119072450.2890107-2-lucas.demarchi@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Jan 2022 11:15:08 +0200
Message-ID: <CAHp75Vf5QOD_UtDK8VbxNApEBuJvzUic0NkzDNmRo3Q7Ud+=qw@mail.gmail.com>
Subject: Re: [PATCH 1/3] lib/string_helpers: Consolidate yesno() implementation
To: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: multipart/alternative; boundary="000000000000817d6d05d5ebd2cd"
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Vishal Kulkarni <vishal@chelsio.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, Mikita Lipski <mikita.lipski@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Leo Li <sunpeng.li@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Raju Rangoju <rajur@chelsio.com>, Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Eryk Brol <eryk.brol@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000817d6d05d5ebd2cd
Content-Type: text/plain; charset="UTF-8"

On Wednesday, January 19, 2022, Lucas De Marchi <lucas.demarchi@intel.com>
wrote:

> There are a few implementations of yesno() in the tree. Consolidate them
> in include/linux/string_helpers.h.  Quite a few users of open coded
> yesno() could later be converted to the new function:
>
> $ git grep '?\s*"yes"\s*' | wc -l
> 286
> $ git grep '?\s*"no"\s*' | wc -l
> 20
>
> The inlined function should keep the const strings local to each
> compilation unit, the same way it's now, thus not changing the current
> behavior.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  6 +-----
>  drivers/gpu/drm/i915/i915_utils.h              |  5 -----
>  .../net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c | 11 -----------
>  include/linux/string_helpers.h                 |  2 ++
>  security/tomoyo/audit.c                        |  2 +-
>  security/tomoyo/common.c                       | 18 ++++--------------
>  security/tomoyo/common.h                       |  1 -
>  7 files changed, 8 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index 9d43ecb1f692..b59760f91bf6 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -23,6 +23,7 @@
>   *
>   */
>
> +#include <linux/string_helpers.h>
>  #include <linux/uaccess.h>
>
>  #include "dc.h"
> @@ -49,11 +50,6 @@ struct dmub_debugfs_trace_entry {
>         uint32_t param1;
>  };
>
> -static inline const char *yesno(bool v)
> -{
> -       return v ? "yes" : "no";
> -}
> -
>  /* parse_write_buffer_into_params - Helper function to parse debugfs
> write buffer into an array
>   *
>   * Function takes in attributes passed to debugfs write entry
> diff --git a/drivers/gpu/drm/i915/i915_utils.h
> b/drivers/gpu/drm/i915/i915_utils.h
> index 7a5925072466..2a8781cc648b 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -414,11 +414,6 @@ wait_remaining_ms_from_jiffies(unsigned long
> timestamp_jiffies, int to_wait_ms)
>  #define MBps(x) KBps(1000 * (x))
>  #define GBps(x) ((u64)1000 * MBps((x)))
>
> -static inline const char *yesno(bool v)
> -{
> -       return v ? "yes" : "no";
> -}
> -
>  static inline const char *onoff(bool v)
>  {
>         return v ? "on" : "off";
> diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c
> b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c
> index 7d49fd4edc9e..61a04d7abc1f 100644
> --- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c
> +++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c
> @@ -2015,17 +2015,6 @@ static const struct file_operations
> rss_debugfs_fops = {
>  /* RSS Configuration.
>   */
>
> -/* Small utility function to return the strings "yes" or "no" if the
> supplied
> - * argument is non-zero.
> - */
> -static const char *yesno(int x)
> -{
> -       static const char *yes = "yes";
> -       static const char *no = "no";
> -
> -       return x ? yes : no;
> -}
> -
>  static int rss_config_show(struct seq_file *seq, void *v)
>  {
>         struct adapter *adapter = seq->private;
> diff --git a/include/linux/string_helpers.h b/include/linux/string_
> helpers.h
> index 4ba39e1403b2..e980dec05d31 100644
> --- a/include/linux/string_helpers.h
> +++ b/include/linux/string_helpers.h
> @@ -102,4 +102,6 @@ char *kstrdup_quotable_file(struct file *file, gfp_t
> gfp);
>
>  void kfree_strarray(char **array, size_t n);
>
> +static inline const char *yesno(bool v) { return v ? "yes" : "no"; }



Perhaps keep it on 4 lines? Yes, yes/no is short, but if we add others
(enable/disable) it will not be possible to keep on one line. And hence
style will be broken among similar functions.


Also it needs to be rebased and resend after -rc1, I expect conflict here.



> +
>  #endif
> diff --git a/security/tomoyo/audit.c b/security/tomoyo/audit.c
> index d79bf07e16be..1458e27361e8 100644
> --- a/security/tomoyo/audit.c
> +++ b/security/tomoyo/audit.c
> @@ -166,7 +166,7 @@ static char *tomoyo_print_header(struct
> tomoyo_request_info *r)
>                        "#%04u/%02u/%02u %02u:%02u:%02u# profile=%u mode=%s
> granted=%s (global-pid=%u) task={ pid=%u ppid=%u uid=%u gid=%u euid=%u
> egid=%u suid=%u sgid=%u fsuid=%u fsgid=%u }",
>                        stamp.year, stamp.month, stamp.day, stamp.hour,
>                        stamp.min, stamp.sec, r->profile,
> tomoyo_mode[r->mode],
> -                      tomoyo_yesno(r->granted), gpid, tomoyo_sys_getpid(),
> +                      yesno(r->granted), gpid, tomoyo_sys_getpid(),
>                        tomoyo_sys_getppid(),
>                        from_kuid(&init_user_ns, current_uid()),
>                        from_kgid(&init_user_ns, current_gid()),
> diff --git a/security/tomoyo/common.c b/security/tomoyo/common.c
> index 5c64927bf2b3..304ed0f426dd 100644
> --- a/security/tomoyo/common.c
> +++ b/security/tomoyo/common.c
> @@ -8,6 +8,7 @@
>  #include <linux/uaccess.h>
>  #include <linux/slab.h>
>  #include <linux/security.h>
> +#include <linux/string_helpers.h>
>  #include "common.h"
>
>  /* String table for operation mode. */
> @@ -174,16 +175,6 @@ static bool tomoyo_manage_by_non_root;
>
>  /* Utility functions. */
>
> -/**
> - * tomoyo_yesno - Return "yes" or "no".
> - *
> - * @value: Bool value.
> - */
> -const char *tomoyo_yesno(const unsigned int value)
> -{
> -       return value ? "yes" : "no";
> -}
> -
>  /**
>   * tomoyo_addprintf - strncat()-like-snprintf().
>   *
> @@ -730,8 +721,8 @@ static void tomoyo_print_config(struct
> tomoyo_io_buffer *head, const u8 config)
>  {
>         tomoyo_io_printf(head, "={ mode=%s grant_log=%s reject_log=%s }\n",
>                          tomoyo_mode[config & 3],
> -                        tomoyo_yesno(config &
> TOMOYO_CONFIG_WANT_GRANT_LOG),
> -                        tomoyo_yesno(config &
> TOMOYO_CONFIG_WANT_REJECT_LOG));
> +                        yesno(config & TOMOYO_CONFIG_WANT_GRANT_LOG),
> +                        yesno(config & TOMOYO_CONFIG_WANT_REJECT_LOG));
>  }
>
>  /**
> @@ -1354,8 +1345,7 @@ static bool tomoyo_print_condition(struct
> tomoyo_io_buffer *head,
>         case 3:
>                 if (cond->grant_log != TOMOYO_GRANTLOG_AUTO)
>                         tomoyo_io_printf(head, " grant_log=%s",
> -                                        tomoyo_yesno(cond->grant_log ==
> -
>  TOMOYO_GRANTLOG_YES));
> +                                        yesno(cond->grant_log ==
> TOMOYO_GRANTLOG_YES));
>                 tomoyo_set_lf(head);
>                 return true;
>         }
> diff --git a/security/tomoyo/common.h b/security/tomoyo/common.h
> index 85246b9df7ca..ca285f362705 100644
> --- a/security/tomoyo/common.h
> +++ b/security/tomoyo/common.h
> @@ -959,7 +959,6 @@ char *tomoyo_read_token(struct tomoyo_acl_param
> *param);
>  char *tomoyo_realpath_from_path(const struct path *path);
>  char *tomoyo_realpath_nofollow(const char *pathname);
>  const char *tomoyo_get_exe(void);
> -const char *tomoyo_yesno(const unsigned int value);
>  const struct tomoyo_path_info *tomoyo_compare_name_union
>  (const struct tomoyo_path_info *name, const struct tomoyo_name_union
> *ptr);
>  const struct tomoyo_path_info *tomoyo_get_domainname
> --
> 2.34.1
>
>

-- 
With Best Regards,
Andy Shevchenko

--000000000000817d6d05d5ebd2cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, January 19, 2022, Lucas De Marchi &lt;<a href=3D"mail=
to:lucas.demarchi@intel.com">lucas.demarchi@intel.com</a>&gt; wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">There are a few implementations of yesno() in t=
he tree. Consolidate them<br>
in include/linux/string_helpers.<wbr>h.=C2=A0 Quite a few users of open cod=
ed<br>
yesno() could later be converted to the new function:<br>
<br>
$ git grep &#39;?\s*&quot;yes&quot;\s*&#39; | wc -l<br>
286<br>
$ git grep &#39;?\s*&quot;no&quot;\s*&#39; | wc -l<br>
20<br>
<br>
The inlined function should keep the const strings local to each<br>
compilation unit, the same way it&#39;s now, thus not changing the current<=
br>
behavior.<br>
<br>
Signed-off-by: Lucas De Marchi &lt;<a href=3D"mailto:lucas.demarchi@intel.c=
om">lucas.demarchi@intel.com</a>&gt;<br>
---<br>
=C2=A0.../amd/display/amdgpu_dm/<wbr>amdgpu_dm_debugfs.c=C2=A0 |=C2=A0 6 +-=
----<br>
=C2=A0drivers/gpu/drm/i915/i915_<wbr>utils.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 5 -----<br>
=C2=A0.../net/ethernet/chelsio/<wbr>cxgb4/cxgb4_debugfs.c | 11 -----------<=
br>
=C2=A0include/linux/string_helpers.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A0security/tomoyo/audit.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0security/tomoyo/common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++--------------<br>
=C2=A0security/tomoyo/common.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
=C2=A07 files changed, 8 insertions(+), 37 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/<wbr>amdgpu_dm/amdgpu_dm_debugfs.c=
 b/drivers/gpu/drm/amd/display/<wbr>amdgpu_dm/amdgpu_dm_debugfs.c<br>
index 9d43ecb1f692..b59760f91bf6 100644<br>
--- a/drivers/gpu/drm/amd/display/<wbr>amdgpu_dm/amdgpu_dm_debugfs.c<br>
+++ b/drivers/gpu/drm/amd/display/<wbr>amdgpu_dm/amdgpu_dm_debugfs.c<br>
@@ -23,6 +23,7 @@<br>
=C2=A0 *<br>
=C2=A0 */<br>
<br>
+#include &lt;linux/string_helpers.h&gt;<br>
=C2=A0#include &lt;linux/uaccess.h&gt;<br>
<br>
=C2=A0#include &quot;dc.h&quot;<br>
@@ -49,11 +50,6 @@ struct dmub_debugfs_trace_entry {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t param1;<br>
=C2=A0};<br>
<br>
-static inline const char *yesno(bool v)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return v ? &quot;yes&quot; : &quot;no&quot;;<br=
>
-}<br>
-<br>
=C2=A0/* parse_write_buffer_into_params - Helper function to parse debugfs =
write buffer into an array<br>
=C2=A0 *<br>
=C2=A0 * Function takes in attributes passed to debugfs write entry<br>
diff --git a/drivers/gpu/drm/i915/i915_<wbr>utils.h b/drivers/gpu/drm/i915/=
i915_<wbr>utils.h<br>
index 7a5925072466..2a8781cc648b 100644<br>
--- a/drivers/gpu/drm/i915/i915_<wbr>utils.h<br>
+++ b/drivers/gpu/drm/i915/i915_<wbr>utils.h<br>
@@ -414,11 +414,6 @@ wait_remaining_ms_from_<wbr>jiffies(unsigned long time=
stamp_jiffies, int to_wait_ms)<br>
=C2=A0#define MBps(x) KBps(1000 * (x))<br>
=C2=A0#define GBps(x) ((u64)1000 * MBps((x)))<br>
<br>
-static inline const char *yesno(bool v)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return v ? &quot;yes&quot; : &quot;no&quot;;<br=
>
-}<br>
-<br>
=C2=A0static inline const char *onoff(bool v)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return v ? &quot;on&quot; : &quot;off&quot;;<br=
>
diff --git a/drivers/net/ethernet/<wbr>chelsio/cxgb4/cxgb4_debugfs.c b/driv=
ers/net/ethernet/<wbr>chelsio/cxgb4/cxgb4_debugfs.c<br>
index 7d49fd4edc9e..61a04d7abc1f 100644<br>
--- a/drivers/net/ethernet/<wbr>chelsio/cxgb4/cxgb4_debugfs.c<br>
+++ b/drivers/net/ethernet/<wbr>chelsio/cxgb4/cxgb4_debugfs.c<br>
@@ -2015,17 +2015,6 @@ static const struct file_operations rss_debugfs_fops=
 =3D {<br>
=C2=A0/* RSS Configuration.<br>
=C2=A0 */<br>
<br>
-/* Small utility function to return the strings &quot;yes&quot; or &quot;n=
o&quot; if the supplied<br>
- * argument is non-zero.<br>
- */<br>
-static const char *yesno(int x)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0static const char *yes =3D &quot;yes&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0static const char *no =3D &quot;no&quot;;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return x ? yes : no;<br>
-}<br>
-<br>
=C2=A0static int rss_config_show(struct seq_file *seq, void *v)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct adapter *adapter =3D seq-&gt;private;<br=
>
diff --git a/include/linux/string_<wbr>helpers.h b/include/linux/string_<wb=
r>helpers.h<br>
index 4ba39e1403b2..e980dec05d31 100644<br>
--- a/include/linux/string_<wbr>helpers.h<br>
+++ b/include/linux/string_<wbr>helpers.h<br>
@@ -102,4 +102,6 @@ char *kstrdup_quotable_file(struct file *file, gfp_t gf=
p);<br>
<br>
=C2=A0void kfree_strarray(char **array, size_t n);<br>
<br>
+static inline const char *yesno(bool v) { return v ? &quot;yes&quot; : &qu=
ot;no&quot;; }</blockquote><div><br></div><div><br></div><div>Perhaps keep =
it on 4 lines? Yes, yes/no is short, but if we add others (enable/disable) =
it will not be possible to keep on one line. And hence style will be broken=
 among similar functions.</div><div><br></div><div><br></div><div>Also it n=
eeds to be rebased and resend after -rc1, I expect conflict here.</div><div=
><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+<br>
=C2=A0#endif<br>
diff --git a/security/tomoyo/audit.c b/security/tomoyo/audit.c<br>
index d79bf07e16be..1458e27361e8 100644<br>
--- a/security/tomoyo/audit.c<br>
+++ b/security/tomoyo/audit.c<br>
@@ -166,7 +166,7 @@ static char *tomoyo_print_header(struct tomoyo_request_=
info *r)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;#%04u/%02u/%02u %02u:%02u:%02u# profile=3D%u mode=3D%s gran=
ted=3D%s (global-pid=3D%u) task=3D{ pid=3D%u ppid=3D%u uid=3D%u gid=3D%u eu=
id=3D%u egid=3D%u suid=3D%u sgid=3D%u fsuid=3D%u fsgid=3D%u }&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0stamp.year, stamp.month, stamp.day, stamp.hour,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0stamp.min, stamp.sec, r-&gt;profile, tomoyo_mode[r-&gt;mode],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tomoyo_yesno(r-&gt;granted), gpid, tomoyo_sys_getpid(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 yesno(r-&gt;granted), gpid, tomoyo_sys_getpid(),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tomoyo_sys_getppid(),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0from_kuid(&amp;init_user_ns, current_uid()),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0from_kgid(&amp;init_user_ns, current_gid()),<br>
diff --git a/security/tomoyo/common.c b/security/tomoyo/common.c<br>
index 5c64927bf2b3..304ed0f426dd 100644<br>
--- a/security/tomoyo/common.c<br>
+++ b/security/tomoyo/common.c<br>
@@ -8,6 +8,7 @@<br>
=C2=A0#include &lt;linux/uaccess.h&gt;<br>
=C2=A0#include &lt;linux/slab.h&gt;<br>
=C2=A0#include &lt;linux/security.h&gt;<br>
+#include &lt;linux/string_helpers.h&gt;<br>
=C2=A0#include &quot;common.h&quot;<br>
<br>
=C2=A0/* String table for operation mode. */<br>
@@ -174,16 +175,6 @@ static bool tomoyo_manage_by_non_root;<br>
<br>
=C2=A0/* Utility functions. */<br>
<br>
-/**<br>
- * tomoyo_yesno - Return &quot;yes&quot; or &quot;no&quot;.<br>
- *<br>
- * @value: Bool value.<br>
- */<br>
-const char *tomoyo_yesno(const unsigned int value)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return value ? &quot;yes&quot; : &quot;no&quot;=
;<br>
-}<br>
-<br>
=C2=A0/**<br>
=C2=A0 * tomoyo_addprintf - strncat()-like-snprintf().<br>
=C2=A0 *<br>
@@ -730,8 +721,8 @@ static void tomoyo_print_config(struct tomoyo_io_buffer=
 *head, const u8 config)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tomoyo_io_printf(head, &quot;=3D{ mode=3D%s gra=
nt_log=3D%s reject_log=3D%s }\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0tomoyo_mode[config &amp; 3],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tomoyo_yesno(config &amp; TOMOYO_CONFIG_WANT_GRANT_LOG),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tomoyo_yesno(config &amp; TOMOYO_CONFIG_WANT_REJECT_LOG)<wbr>);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 yesno(config &amp; TOMOYO_CONFIG_WANT_GRANT_LOG),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 yesno(config &amp; TOMOYO_CONFIG_WANT_REJECT_LOG)<wbr>);<br>
=C2=A0}<br>
<br>
=C2=A0/**<br>
@@ -1354,8 +1345,7 @@ static bool tomoyo_print_condition(struct tomoyo_io_b=
uffer *head,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 3:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cond-&gt;grant_=
log !=3D TOMOYO_GRANTLOG_AUTO)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tomoyo_io_printf(head, &quot; grant_log=3D%s&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tomoyo_y=
esno(cond-&gt;grant_log =3D=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TOMOYO_GRANTLOG_YES));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yesno(co=
nd-&gt;grant_log =3D=3D TOMOYO_GRANTLOG_YES));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tomoyo_set_lf(head)=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
diff --git a/security/tomoyo/common.h b/security/tomoyo/common.h<br>
index 85246b9df7ca..ca285f362705 100644<br>
--- a/security/tomoyo/common.h<br>
+++ b/security/tomoyo/common.h<br>
@@ -959,7 +959,6 @@ char *tomoyo_read_token(struct tomoyo_acl_param *param)=
;<br>
=C2=A0char *tomoyo_realpath_from_path(<wbr>const struct path *path);<br>
=C2=A0char *tomoyo_realpath_nofollow(<wbr>const char *pathname);<br>
=C2=A0const char *tomoyo_get_exe(void);<br>
-const char *tomoyo_yesno(const unsigned int value);<br>
=C2=A0const struct tomoyo_path_info *tomoyo_compare_name_union<br>
=C2=A0(const struct tomoyo_path_info *name, const struct tomoyo_name_union =
*ptr);<br>
=C2=A0const struct tomoyo_path_info *tomoyo_get_domainname<br>
-- <br>
2.34.1<br>
<br>
</blockquote><br><br>-- <br>With Best Regards,<br>Andy Shevchenko<br><br><b=
r>

--000000000000817d6d05d5ebd2cd--
