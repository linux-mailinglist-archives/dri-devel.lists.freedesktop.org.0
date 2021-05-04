Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E01603726DC
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 10:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB496EAA5;
	Tue,  4 May 2021 08:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3FC6EAA1;
 Tue,  4 May 2021 08:00:26 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id q2so6608331pfh.13;
 Tue, 04 May 2021 01:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=1ylC9ShWY/I9eI56AJKrNab7WRbCq2Eeo1b2uR5U/0o=;
 b=WoDRZi3ibdURrXMHIzg8bPhqKgmZnc7R+BPnaQm//YcSrK+vXcQBnYGWm3Cl8rd7k6
 plmBjRCM0gilvagiyAHy5f+7pxs9VPdz5i5H95duq+7zOJ6wv1xsBqKhFcKn6KR1rR8k
 aySPD0qbgRtnPyzebxipAGW9EEiV8xdCCQQ6WFIyMO6GAxxPFE9WR8KiMTCU6/B3nNJ8
 r7xooVURDoKpNk1Co9GxI19ElUXIfkFOcO+U3jkwV6TL3auLtEHuJ6mClAEIZxnOL1Vf
 mg6r7aHzB+Vt3E8YwX0+xd+WPJzuv0yuDr82cZmNtHeO9VzrmDUXD1+E6pafnHNb1UBS
 o5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=1ylC9ShWY/I9eI56AJKrNab7WRbCq2Eeo1b2uR5U/0o=;
 b=beFYTXzitL1reTkh3ljRH6XdFoe6zKY7AIl9YXxIJQvsRr1AmEl2jvgzvXqFeXFvvx
 CgN38MvNqYtKUNGFZhIIAcP+lNYmmD/QESChxbCWo4JF9U1mWZtM4pvz10ODkzAZdlsy
 ZBqGcUpHw6fk8VDSg8VEgNVphchrtvp0BIGEzUUl0erS6WPxXFjrMsNXvl+95qAHpkLc
 4q2/yJOoIYGChWhejLsGBAf/eQO8xcw4P+zlw2IfjyRdSQAswa62/Y3XyXO+PI09rjwZ
 jFEOFYuTGUIV3L9Iy1KcNSjhSQJaXk6fY6Fxj5DthJZuQ0/6eU02HlRcXP4wLdcariIS
 LJMg==
X-Gm-Message-State: AOAM531WrcQ1D7pLcTMwjReve1HJTo8SPcqB5CDT3tLBRoBgx3VW47Jv
 NHRWZUQTXfPdqitnNRikWTQc4sTdXLsY2imrCTk=
X-Google-Smtp-Source: ABdhPJyuUN5rgPtYKhds3x5z8XTw2huk9MRxeC4zY+lzV4WprRJbjikwSEY6sPJskffQkfLXmFhft8Vq98Q3sGBdwKg=
X-Received: by 2002:a62:528e:0:b029:1f5:c5ee:a487 with SMTP id
 g136-20020a62528e0000b02901f5c5eea487mr22574807pfb.7.1620115226202; Tue, 04
 May 2021 01:00:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90b:d81:0:0:0:0 with HTTP; Tue, 4 May 2021 01:00:25
 -0700 (PDT)
In-Reply-To: <20210503154647.142551-4-hdegoede@redhat.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-4-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 4 May 2021 11:00:25 +0300
Message-ID: <CAHp75Vcv=sUHafBMjV+BMJgmpsXF0iUn5gudb26E2xGapCiMxg@mail.gmail.com>
Subject: Re: [PATCH 3/9] drm/connector: Add drm_connector_find_by_fwnode()
 function (v2)
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: multipart/mixed; boundary="===============1484547767=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1484547767==
Content-Type: multipart/alternative; boundary="0000000000008d93ff05c17c7856"

--0000000000008d93ff05c17c7856
Content-Type: text/plain; charset="UTF-8"

On Monday, May 3, 2021, Hans de Goede <hdegoede@redhat.com> wrote:

> Add a function to find a connector based on a fwnode.
>
> This will be used by the new drm_connector_oob_hotplug_event()
> function which is added by the next patch in this patch-set.
>
> Changes in v2:
> - Complete rewrite to use a global connector list in drm_connector.c
>   rather then using a class-dev-iter in drm_sysfs.c
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/drm_connector.c     | 50 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_crtc_internal.h |  1 +
>  include/drm/drm_connector.h         |  8 +++++
>  3 files changed, 59 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_
> connector.c
> index 87c68563e6c3..ef759d6add81 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -66,6 +66,14 @@
>   * support can instead use e.g. drm_helper_hpd_irq_event().
>   */
>
> +/*
> + * Global connector list for drm_connector_find_by_fwnode().
> + * Note drm_connector_[un]register() first take connector->lock and then
> + * take the connector_list_lock.
> + */
> +static DEFINE_MUTEX(connector_list_lock);
> +static LIST_HEAD(connector_list);
> +
>  struct drm_conn_prop_enum_list {
>         int type;
>         const char *name;
> @@ -267,6 +275,7 @@ int drm_connector_init(struct drm_device *dev,
>                 goto out_put_type_id;
>         }
>
> +       INIT_LIST_HEAD(&connector->global_connector_list_entry);
>         INIT_LIST_HEAD(&connector->probed_modes);
>         INIT_LIST_HEAD(&connector->modes);
>         mutex_init(&connector->mutex);
> @@ -540,6 +549,9 @@ int drm_connector_register(struct drm_connector
> *connector)
>                 drm_privacy_screen_register_notifier(connector->privacy_
> screen,
>                                            &connector->privacy_screen_
> notifier);
>
> +       mutex_lock(&connector_list_lock);
> +       list_add_tail(&connector->global_connector_list_entry,
> &connector_list);
> +       mutex_unlock(&connector_list_lock);
>         goto unlock;
>
>  err_debugfs:
> @@ -568,6 +580,10 @@ void drm_connector_unregister(struct drm_connector
> *connector)
>                 return;
>         }
>
> +       mutex_lock(&connector_list_lock);
> +       list_del_init(&connector->global_connector_list_entry);
> +       mutex_unlock(&connector_list_lock);
> +
>         if (connector->privacy_screen)
>                 drm_privacy_screen_unregister_notifier(
>                                         connector->privacy_screen,
> @@ -2676,6 +2692,40 @@ int drm_mode_getconnector(struct drm_device *dev,
> void *data,
>         return ret;
>  }
>
> +/**
> + * drm_connector_find_by_fwnode - Find a connector based on the
> associated fwnode
> + * @fwnode: fwnode for which to find the matching drm_connector
> + *
> + * This functions looks up a drm_connector based on its associated
> fwnode. When
> + * a connector is found a reference to the connector is returned. The
> caller must
> + * call drm_connector_put() to release this reference when it is done
> with the
> + * connector.
> + *
> + * Returns: A reference to the found connector or an ERR_PTR().
> + */
> +struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle
> *fwnode)
> +{
> +       struct drm_connector *connector, *found = ERR_PTR(-ENODEV);
> +
> +       if (!fwnode)
> +               return ERR_PTR(-ENODEV);
> +
> +       mutex_lock(&connector_list_lock);
> +
> +       list_for_each_entry(connector, &connector_list,
> global_connector_list_entry) {
> +               if (connector->fwnode == fwnode ||
> +                   (connector->fwnode && connector->fwnode->secondary ==
> fwnode)) {
> +                       drm_connector_get(connector);
> +                       found = connector;
> +                       break;
> +               }
> +       }
> +
> +       mutex_unlock(&connector_list_lock);
> +
> +       return found;



If I am not mistaken you can replace this with

return list_entry_is_head();

call and remove additional Boolean variable.


> +}
> +
>
>  /**
>   * DOC: Tile group
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h
> b/drivers/gpu/drm/drm_crtc_internal.h
> index 54d4cf1233e9..6e28fc00a740 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -185,6 +185,7 @@ int drm_connector_set_obj_prop(struct drm_mode_object
> *obj,
>  int drm_connector_create_standard_properties(struct drm_device *dev);
>  const char *drm_get_connector_force_name(enum drm_connector_force force);
>  void drm_connector_free_work_fn(struct work_struct *work);
> +struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle
> *fwnode);
>
>  /* IOCTL */
>  int drm_connector_property_set_ioctl(struct drm_device *dev,
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index d20bfd7576ed..ae377354e48e 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1267,6 +1267,14 @@ struct drm_connector {
>          */
>         struct list_head head;
>
> +       /**
> +        * @global_connector_list_entry:
> +        *
> +        * Connector entry in the global connector-list, used by
> +        * drm_connector_find_by_fwnode().
> +        */
> +       struct list_head global_connector_list_entry;
> +
>         /** @base: base KMS object */
>         struct drm_mode_object base;
>
> --
> 2.31.1
>
>

-- 
With Best Regards,
Andy Shevchenko

--0000000000008d93ff05c17c7856
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, May 3, 2021, Hans de Goede &lt;<a href=3D"mailto:hdegoed=
e@redhat.com">hdegoede@redhat.com</a>&gt; wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">Add a function to find a connector based on a fwnode.<br>
<br>
This will be used by the new drm_connector_oob_hotplug_<wbr>event()<br>
function which is added by the next patch in this patch-set.<br>
<br>
Changes in v2:<br>
- Complete rewrite to use a global connector list in drm_connector.c<br>
=C2=A0 rather then using a class-dev-iter in drm_sysfs.c<br>
<br>
Signed-off-by: Hans de Goede &lt;<a href=3D"mailto:hdegoede@redhat.com">hde=
goede@redhat.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/drm_connector.<wbr>c=C2=A0 =C2=A0 =C2=A0| 50 ++++++++=
+++++++++++++++++++++<br>
=C2=A0drivers/gpu/drm/drm_crtc_<wbr>internal.h |=C2=A0 1 +<br>
=C2=A0include/drm/drm_connector.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
8 +++++<br>
=C2=A03 files changed, 59 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/drm_<wbr>connector.c b/drivers/gpu/drm/drm_<wb=
r>connector.c<br>
index 87c68563e6c3..ef759d6add81 100644<br>
--- a/drivers/gpu/drm/drm_<wbr>connector.c<br>
+++ b/drivers/gpu/drm/drm_<wbr>connector.c<br>
@@ -66,6 +66,14 @@<br>
=C2=A0 * support can instead use e.g. drm_helper_hpd_irq_event().<br>
=C2=A0 */<br>
<br>
+/*<br>
+ * Global connector list for drm_connector_find_by_fwnode()<wbr>.<br>
+ * Note drm_connector_[un]register() first take connector-&gt;lock and the=
n<br>
+ * take the connector_list_lock.<br>
+ */<br>
+static DEFINE_MUTEX(connector_list_<wbr>lock);<br>
+static LIST_HEAD(connector_list);<br>
+<br>
=C2=A0struct drm_conn_prop_enum_list {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int type;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *name;<br>
@@ -267,6 +275,7 @@ int drm_connector_init(struct drm_device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_put_type_i=
d;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_LIST_HEAD(&amp;connector-&gt;<wbr>global_c=
onnector_list_entry);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 INIT_LIST_HEAD(&amp;connector-&gt;<wbr>probed_m=
odes);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 INIT_LIST_HEAD(&amp;connector-&gt;<wbr>modes);<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_init(&amp;connector-&gt;mutex);<br>
@@ -540,6 +549,9 @@ int drm_connector_register(struct drm_connector *connec=
tor)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_privacy_screen_=
register_<wbr>notifier(connector-&gt;privacy_<wbr>screen,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&amp;connector-&gt;privacy_screen_<wbr>notifier);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;connector_list_<wbr>lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0list_add_tail(&amp;connector-&gt;<wbr>global_co=
nnector_list_entry, &amp;connector_list);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;connector_list_<wbr>lock);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto unlock;<br>
<br>
=C2=A0err_debugfs:<br>
@@ -568,6 +580,10 @@ void drm_connector_unregister(<wbr>struct drm_connecto=
r *connector)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;connector_list_<wbr>lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0list_del_init(&amp;connector-&gt;<wbr>global_co=
nnector_list_entry);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;connector_list_<wbr>lock);<br=
>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (connector-&gt;privacy_screen)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_privacy_screen_=
unregister_<wbr>notifier(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 connecto=
r-&gt;privacy_screen,<br>
@@ -2676,6 +2692,40 @@ int drm_mode_getconnector(struct drm_device *dev, vo=
id *data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
+/**<br>
+ * drm_connector_find_by_fwnode - Find a connector based on the associated=
 fwnode<br>
+ * @fwnode: fwnode for which to find the matching drm_connector<br>
+ *<br>
+ * This functions looks up a drm_connector based on its associated fwnode.=
 When<br>
+ * a connector is found a reference to the connector is returned. The call=
er must<br>
+ * call drm_connector_put() to release this reference when it is done with=
 the<br>
+ * connector.<br>
+ *<br>
+ * Returns: A reference to the found connector or an ERR_PTR().<br>
+ */<br>
+struct drm_connector *drm_connector_find_by_fwnode(<wbr>struct fwnode_hand=
le *fwnode)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_connector *connector, *found =3D ERR=
_PTR(-ENODEV);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fwnode)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-ENO=
DEV);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;connector_list_<wbr>lock);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry(connector, &amp;connector_l=
ist, global_connector_list_entry) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (connector-&gt;f=
wnode =3D=3D fwnode ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(conn=
ector-&gt;fwnode &amp;&amp; connector-&gt;fwnode-&gt;secondary =3D=3D fwnod=
e)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0drm_connector_get(connector);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0found =3D connector;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;connector_list_<wbr>lock);<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return found;</blockquote><div><br></div><div><=
br></div><div>If I am not mistaken you can replace this with</div><div><br>=
</div><div>return list_entry_is_head();</div><div><br></div><div>call and r=
emove additional Boolean variable.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
+}<br>
+<br>
<br>
=C2=A0/**<br>
=C2=A0 * DOC: Tile group<br>
diff --git a/drivers/gpu/drm/drm_crtc_<wbr>internal.h b/drivers/gpu/drm/drm=
_crtc_<wbr>internal.h<br>
index 54d4cf1233e9..6e28fc00a740 100644<br>
--- a/drivers/gpu/drm/drm_crtc_<wbr>internal.h<br>
+++ b/drivers/gpu/drm/drm_crtc_<wbr>internal.h<br>
@@ -185,6 +185,7 @@ int drm_connector_set_obj_prop(<wbr>struct drm_mode_obj=
ect *obj,<br>
=C2=A0int drm_connector_create_standard_<wbr>properties(struct drm_device *=
dev);<br>
=C2=A0const char *drm_get_connector_force_name(<wbr>enum drm_connector_forc=
e force);<br>
=C2=A0void drm_connector_free_work_fn(<wbr>struct work_struct *work);<br>
+struct drm_connector *drm_connector_find_by_fwnode(<wbr>struct fwnode_hand=
le *fwnode);<br>
<br>
=C2=A0/* IOCTL */<br>
=C2=A0int drm_connector_property_set_<wbr>ioctl(struct drm_device *dev,<br>
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h<br>
index d20bfd7576ed..ae377354e48e 100644<br>
--- a/include/drm/drm_connector.h<br>
+++ b/include/drm/drm_connector.h<br>
@@ -1267,6 +1267,14 @@ struct drm_connector {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct list_head head;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @global_connector_list_entry:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Connector entry in the global connector-list=
, used by<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * drm_connector_find_by_fwnode()<wbr>.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct list_head global_connector_list_entry;<b=
r>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /** @base: base KMS object */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_mode_object base;<br>
=C2=A0<br>
-- <br>
2.31.1<br>
<br>
</blockquote><br><br>-- <br>With Best Regards,<br>Andy Shevchenko<br><br><b=
r>

--0000000000008d93ff05c17c7856--

--===============1484547767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1484547767==--
